import 'dart:async';

import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:bak/pages/category/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:intl/intl.dart';

class AddProductPage extends StatefulWidget {
  User user;

  AddProductPage({this.user});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  Category categoryItem;
  List<Asset> _images;
  List<Tag> _tags = List<Tag>();
  int index = 0;
  double _value = 0;

  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.lightBlueAccent,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.white,
    Colors.grey,
    Colors.black,
  ];

  List<bool> colorSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String userID;

  String title;
  List<String> imageURI = List<String>();

  String description;
  String updateDate;
  String soldDate;

  String status;
  String price;
  String deliveryFee;

  String state;
  String size;
  String material;
  List<String> color = List<String>();

  bool payCard = false;
  String rate;
  String category;

  List<String> liked = List<String>();
  List<String> tags = List<String>();
  List<String> reviews = List<String>();
  List<String> collections = List<String>();

  String brand;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      appBar: appBarDefault(context, '상품 등록'),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            productImages(context),
            productField(context),
            palette(context),
            stateSlider(context),
            productTags(context),
            acceptCardPayment(context),
            uploadButton(context),
          ],
        ),
      ),
    );
  }

  Widget productImages(BuildContext context) {
    List<Widget> imageList = [emptyImageBox(context)];

    if (_images != null)
      for (int i = 0; i < _images.length; i++)
        imageList.add(imageBox(context, _images[i]));

    return Container(
      height: 118,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        scrollDirection: Axis.horizontal,
        children: imageList,
      ),
    );
  }

  Widget emptyImageBox(BuildContext context) {
    const double _length = 92;

    return Material(
      child: InkWell(
        onTap: () {
          loadAssets();
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          width: _length,
          height: _length,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: offWhite,
          ),
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      _formKey.currentState.save();
      if (_images == null) _images = List<Asset>();
    });

    List<Asset> resultList;
    String _error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: _images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          useDetailsView: false,
          selectCircleStrokeColor: "#FFFFFF",
        ),
      );
    } on Exception catch (e) {
      _error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      for (int i = index; i < resultList.length + index; i++)
        _images = resultList;
      _error = _error;
    });
  }

  Widget imageBox(BuildContext context, Asset image) {
    const double _length = 92;

    return Material(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(right: 15),
          width: _length,
          height: _length,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: offWhite,
          ),
          child: AssetThumb(
            asset: image,
            quality: 100,
            width: image.originalWidth,
            height: image.originalHeight,
          ),
        ),
      ),
    );
  }

  Widget productField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          textFieldTitle(context),
          categorySelector(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallTextFieldSize(context),
              smallTextFieldMaterial(context),
            ],
          ),
          textFieldBrand(context),
          longTextField(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              smallTextFieldPrice(context),
              smallTextFieldDeliveryFee(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget textFieldTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) return '상품명을 입력하세요.';
          return null;
        },
        onSaved: (value) => title = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '상품명'),
      ),
    );
  }

  Widget categorySelector(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          categoryItem = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => CategoryPage()));
          setState(() {
            categoryItem == null ? null : categoryItem;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: offWhite),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: isCategorySelected(context, categoryItem),
          ),
        ),
      ),
    );
  }

  Widget isCategorySelected(BuildContext context, Category categoryItem) {
    if (categoryItem == null)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('카테고리 선택'),
          ),
          ImageIcon(
            AssetImage(forward_idle),
            size: 12,
            color: semiDark,
          ),
        ],
      );
    else
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(categoryItem.parent + ' > ' + categoryItem.title),
      );
  }

  Widget smallTextFieldSize(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => size = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '사이즈 (선택)'),
      ),
    );
  }

  Widget smallTextFieldMaterial(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => material = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '재질 (선택)'),
      ),
    );
  }

  Widget textFieldBrand(BuildContext context) {
    //tag
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => brand = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '브랜드 (선택)'),
      ),
    );
  }

  Widget longTextField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 88,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) return '상품 설명을 입력하세요.';
          return null;
        },
        onSaved: (value) => description = value,
        maxLines: 5,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            border: InputBorder.none,
            hintText: '상품 설명'),
      ),
    );
  }

  Widget smallTextFieldPrice(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.numberWithOptions(signed: true),
        validator: (value) {
          if (value.isEmpty) return '가격을 입력하세요.';
          return null;
        },
        onSaved: (value) => price = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '가격'),
      ),
    );
  }

  Widget smallTextFieldDeliveryFee(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.numberWithOptions(signed: true),
        onSaved: (value) => deliveryFee = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '배송비 (선택)'),
      ),
    );
  }

  Widget palette(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorCircle(context, 0),
              colorCircle(context, 1),
              colorCircle(context, 2),
              colorCircle(context, 3),
              colorCircle(context, 4),
              colorCircle(context, 5),
            ],
          ),
          hSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorCircle(context, 6),
              colorCircle(context, 7),
              colorCircle(context, 8),
              colorCircle(context, 9),
              colorCircle(context, 10),
              colorCircle(context, 11),
            ],
          )
        ],
      ),
    );
  }

//  Widget palette2(BuildContext context) {
//    return Container(
//      child: Wrap(
//        alignment: WrapAlignment.center,
//        direction: Axis.horizontal,
//        children: colorItemBuilder(context),
//      ),
//    );
//  }
//
//  List<Widget> colorItemBuilder(BuildContext context) {
//    List<Widget> items = List<Widget>();
//
//    for (int i = 0; i < colors.length; i++) items.add(colorCircle(context, i));
//
//    return items;
//  }

  Widget colorCircle(BuildContext context, int index) {
    const double _r = 32;

    var checkIcon;
    bool isWhite = colors[index] == Colors.white;
    if (isWhite)
      checkIcon = ImageIcon(
        AssetImage(check_idle),
        color: primary,
      );
    else
      checkIcon = ImageIcon(
        AssetImage(check_idle),
        color: offWhite,
      );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: _r,
      height: _r,
      child: Material(
        child: InkWell(
          onTap: () {
            setState(() {
              colorSelected[index] = !colorSelected[index];
              checkIcon = colorSelected[index] ? checkIcon : null;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _r,
                height: _r,
                decoration: !isWhite
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: colors[index])
                    : BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(100),
                        color: colors[index]),
              ),
              Align(child: colorSelected[index] ? checkIcon : null),
            ],
          ),
        ),
      ),
    );
  }

  Widget stateSlider(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: primary,
              activeTickMarkColor: primary,
              inactiveTrackColor: semiDark,
              inactiveTickMarkColor: semiDark,
              thumbColor: primary,
              overlayColor: Colors.transparent),
          child: Slider(
              min: 0,
              max: 10,
              value: _value,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  state = _value.toString();
                });
              }),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New'),
              Text('Old'),
            ],
          ),
        )
      ],
    );
  }

  Widget productTags(BuildContext context) {
    List<Widget> tagList = [emptyTagBox(context)];

    if (_tags?.isEmpty ?? true)
      for (int i = 0; i < _tags.length; i++)
        tagList.add(tagBox(context, _tags[i]));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('태그 추가'),
          ),
          Container(
            height: 45,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              scrollDirection: Axis.horizontal,
              children: tagList,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadTags() async {
    setState(() {
      _formKey.currentState.save();
      if (_tags == null) _tags = List<Tag>();
    });

    String tag;
    String _error;

    try {
      tag = await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('태그를 추가하세요.'),
              content: TextFormField(
                onChanged: (value) => tag = value,
                style: TextStyle(
                  fontSize: 12,
                ),
                cursorColor: primary,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: primary,
                      ),
                    ),
                    hintText: ''),
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  color: primary,
                  child: Text('취소'),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, tag),
                  color: primary,
                  child: Text('추가'),
                )
              ],
            );
          });
    } on Exception catch (e) {
      _error = e.toString();
    }

    setState(() {
      _tags.add(Tag(tag));
      _error = _error;
    });
  }

  Widget emptyTagBox(BuildContext context) {
    const double _length = 30;

    return Material(
      child: InkWell(
        onTap: () {
          loadTags();
        },
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: _length,
          height: _length,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: offWhite,
          ),
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget tagBox(BuildContext context, Tag tag) {
    return Material(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          width: tag.title.length * 10 + 30.0,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: offWhite,
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                  child: Center(
                child: Text(tag.title),
              )),
              Material(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                  child: ImageIcon(
                    AssetImage(delete_tag_idle),
                    size: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget acceptCardPayment(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('카드 결제 허용하기'),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: primary,
                  value: payCard,
                  onChanged: (value) {
                    setState(() {
                      payCard = !payCard;
                    });
                  },
                ),
              ),
            ],
          ),
          Text('택배 어쩌구 저쩌구'),
        ],
      ),
    );
  }

  Widget uploadButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            _formKey.currentState.save();
          });

          if (_images?.isEmpty ?? true)
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(Duration(seconds: 2), () {});
                  return AlertDialog(
                    content: Text('선택된 이미지가 없습니다!'),
                  );
                });
          else if (categoryItem == null)
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(Duration(seconds: 2), () {});
                  return AlertDialog(
                    content: Text('선택된 카테고리가 없습니다!'),
                  );
                });
          else
            showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('잠깐만!'),
                  content: Text('지금 등록하신 상품이 택배 발송이 가능한 상품이 확실한가요?'),
                  actions: [
                    Row(
                      children: [
                        buttonNo(context),
                        wSpacer(20),
                        buttonYes(context),
                      ],
                    )
                  ],
                );
              },
            );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text(
              '등록하기',
              style: label(offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonNo(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context, false);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (120 / 375),
          height: 36,
          decoration: BoxDecoration(
              border: Border.all(color: primary), color: offWhite),
          child: Center(
            child: Text(
              '아니요',
              style: action1(primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonYes(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (_formKey.currentState.validate()) {
            if (brand != '') _tags.add(Tag(brand));
            if (size != '') _tags.add(Tag(size));
            if (material != '') _tags.add(Tag(material));

            for (int i = 0; i < colorSelected.length; i++) {
              if (colorSelected[i])
                color.add(colors[i].value.toRadixString(16));
            }

            add();
            Navigator.pop(context, true);
          } else
            print('fail');
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (120 / 375),
          height: 36,
          color: primary,
          child: Center(
            child: Text(
              '네!',
              style: action1(offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> add() async {
    _autoValidate = true;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String urlTitle = title.replaceAll(' ', '_');

      setState(() {
        imageURI = List<String>();
      });

      for (int i = 0; i < _images.length; i++) {
        uploadImages(_images[i], i);
        imageURI.add('gs://newnew-beta.appspot.com/product/' +
            widget.user.username +
            '+' +
            urlTitle +
            '+' +
            i.toString() +
            '.jpg');
      }

      addProduct();
      try {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => BootPage(
                      user: widget.user,
                    )),
            (route) => false);
      } catch (e) {
        print(e.message);
      }
    }
  }

  Future uploadImages(Asset asset, int index) async {
    if (_images == null) return;

    String urlTitle = title.replaceAll(' ', '_');

    String path = 'product/' +
        widget.user.username +
        '+' +
        urlTitle +
        '+' +
        index.toString() +
        '.jpg';
    ByteData byteData = await asset.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = ref.putData(imageData);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  void addProduct() {
    for (int i = 0; i < _tags.length; i++) {
      tags.add(_tags[i].title);
    }

    Firestore.instance
        .collection('products')
        .document(widget.user.username + '+' + title)
        .setData({
      "userID": widget.user.username ?? "",
      "title": title ?? "",
      "imageURI": imageURI ??
          FieldValue.arrayUnion(['gs://newnew-beta.appspot.com/IMG_0909.JPG']),
      "description": description ?? "",
      "updateDate": DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
      "soldDate": soldDate ?? "",
      "status": "on sale",
      "price": price ?? "",
      "deliveryFee": deliveryFee ?? "",
      "state": state ?? "",
      "size": size ?? "",
      "material": material ?? "",
      "color": color,
      "category": categoryItem.title,
      "liked": liked,
      "tags": tags,
      "reviews": reviews,
      "collections": collections,
      "payCard": payCard,
      "rate": rate ?? "",
    }).then((value) {
      Firestore.instance
          .collection('users')
          .document(widget.user.username)
          .updateData({
        "myProducts":
            FieldValue.arrayUnion([widget.user.username + '+' + title])
      });
    });
  }
}
