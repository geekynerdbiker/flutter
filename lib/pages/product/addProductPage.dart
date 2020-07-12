import 'dart:async';

import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:bak/pages/category/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddProductPage extends StatefulWidget {
  final User user;

  AddProductPage({this.user});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  Category categoryItem;
  List<Asset> _images;
  List<Tag> _tags;
  int index = 0;

  String userID;
  String title;
  String imageURI;
  String description;
  String updateDate;
  String soldDate;
  String status;
  String price;
  String deliveryFee;
  String state;
  String size;
  String material;
  String color;
  String category;
  String tags;
  String reviews;
  String collection;
  String rate;

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
          longButtonNav(
              context,
              offWhite,
              true,
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('취향 선택 (선택)'),
                      ),
                      ImageIcon(
                        AssetImage(forward_idle),
                        size: 12,
                        color: semiDark,
                      )
                    ],
                  )),
              favorite(context)),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (335 / 375),
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
          width: MediaQuery
              .of(context)
              .size
              .width * (335 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (163 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (163 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (335 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (335 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (163 / 375),
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
      width: MediaQuery
          .of(context)
          .size
          .width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.numberWithOptions(signed: true),
        validator: (value) {
          if (value.isEmpty) return '배송비를 입력하세요.';
          return null;
        },
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
              ColorCircle(color: Colors.red),
              ColorCircle(color: Colors.orange),
              ColorCircle(color: Colors.yellow),
              ColorCircle(color: Colors.lightGreen),
              ColorCircle(color: Colors.green),
              ColorCircle(color: Colors.lightBlueAccent),
            ],
          ),
          hSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorCircle(color: Colors.blue),
              ColorCircle(color: Colors.purple),
              ColorCircle(color: Colors.pink),
              ColorCircle(color: Colors.white),
              ColorCircle(color: Colors.grey),
              ColorCircle(color: Colors.black),
            ],
          )
        ],
      ),
    );
  }

  Widget stateSlider(BuildContext context) {
    return Column(
      children: [
        StateSlider(),
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('태그 추가'),
          ),
          productTagList(context),
        ],
      ),
    );
  }

  Widget productTagList(BuildContext context) {
    List<Widget> tagList = [emptyTagBox(context)];

    if (_tags != null)
      for (int i = 0; i < _tags.length; i++)
        tagList.add(tagBox(context, _tags[i]));

    return Container(
        height: 45,
        child: Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.horizontal,
            children: tagList,
          ),
        ));
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
      if (tag != null) _tags.add(Tag(tag));
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
          width: tag.title.length * 7 + 35.0,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: offWhite,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
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
              SelectionSwitch(),
            ],
          ),
          Text('택배 어쩌구 저쩌구'),
        ],
      ),
    );
  }

  Widget uploadButton(BuildContext context) {
    bool confirm = false;

    return Material(
      child: InkWell(
        onTap: () async {
          confirm = await showDialog<bool>(
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
          if(confirm) add;
        },
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * (335 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text(
              '등록하기',
              style: label(offWhite),
            ),
          ),
        ),
      )
      ,
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
          decoration: BoxDecoration(border: Border.all(color: primary), color: offWhite),
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
          Navigator.pop(context, true);
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
    final FormState formState = _formKey.currentState;
    _autoValidate = true;

    if (formState.validate()) {
      formState.save();
      addProduct();
      try {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BootPage()),
                (route) => false);
      } catch (e) {
        print(e.message);
      }
    }
  }

  void addProduct() {
    Firestore.instance.collection('products').add({
      "userID": userID ?? "_NULL",
      "title": title ?? "_NULL",
      "imageURI": imageURI ?? ["_NULL"],
      "description": description ?? "_NULL",
      "updateDate": DateTime.now().toString(),
      "soldDate": soldDate ?? "_NULL",
      "status": "onSale",
      "price": price ?? "_NULL",
      "deliveryFee": deliveryFee ?? "_NULL",
      "state": state ?? "_NULL",
      "size": size ?? "_NULL",
      "material": material ?? "_NULL",
      "color": color ?? ["_NULL"],
      "category": categoryItem.title ?? "_NULL",
      "tags": tags ?? ["_NULL"],
      "reviews": reviews ?? ["_NULL"],
      "collection": collection ?? ["_NULL"],
      "rate": rate ?? "_NULL",
    });
  }
}

class ColorCircle extends StatefulWidget {
  final Color color;

  ColorCircle({this.color});

  @override
  _ColorCircle createState() => _ColorCircle();
}

class _ColorCircle extends State<ColorCircle> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return colorCircle(context, widget.color);
  }

  Widget colorCircle(BuildContext context, Color _color) {
    const double _r = 32;
    var checkIcon = ImageIcon(
      AssetImage(check_idle),
      color: offWhite,
    );

    if (_color == Colors.white) {
      var checkIcon = ImageIcon(
        AssetImage(check_idle),
        color: primary,
      );
      return Material(
        child: InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
                checkIcon = isSelected ? checkIcon : null;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: _r,
                  height: _r,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(100),
                      color: _color),
                ),
                Align(child: isSelected ? checkIcon : null),
              ],
            )),
      );
    }

    return Material(
      child: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
              checkIcon = isSelected ? checkIcon : null;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _r,
                height: _r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: _color),
              ),
              Center(child: isSelected ? checkIcon : null),
            ],
          )),
    );
  }
}

class StateSlider extends StatefulWidget {
  _StateSlider createState() => _StateSlider();
}

class _StateSlider extends State<StateSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
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
            });
          }),
    );
  }
}

class SelectionSwitch extends StatefulWidget {
  @override
  _SelectionSwitch createState() => _SelectionSwitch();
}

class _SelectionSwitch extends State<SelectionSwitch> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: primary,
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
      ),
    );
  }
}
