import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> with AutomaticKeepAliveClientMixin<AddProductPage> {
  bool get wantKeepAlive => true;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Asset> _images;

  int index = 0;
  double _value = 0;

  String pid;
  String title;
  String description;

  int price;
  int likes;
  String category;

  List<String> imageURI = [];
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            productImages(context),
            productField(context),
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
            color: Colors.white,
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
            color: Colors.white,
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
        children: [],
      ),
    );
  }

  // //
  // // Widget productTags(BuildContext context) {
  // //   List<Widget> tagList = [ emptyTagBox(context)];
  // //
  // //   if (_tags?.isEmpty ?? true)
  // //     for (int i = 0; i < _tags.length; i++)
  // //       tagList.add(tagBox(context, _tags[i]));
  // //
  // //   return Container(
  // //     child: Column(
  // //       crossAxisAlignment: CrossAxisAlignment.start,
  // //       children: [
  // //         Container(
  // //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  // //           child: Text('태그 추가'),
  // //         ),
  // //         Container(
  // //           height: 45,
  // //           child: ListView(
  // //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
  // //             scrollDirection: Axis.horizontal,
  // //             children: tagList,
  // //           ),
  // //         ),
  // //       ],
  // //     ),
  // //   );
  // // }
  // //
  // // Future<void> loadTags() async {
  // //   setState(() {
  // //     _formKey.currentState.save();
  // //     if (_tags == null) _tags = List<Tag>();
  // //   });
  // //
  // //   String tag;
  // //   String _error;
  // //
  // //   try {
  // //     tag = await showDialog<String>(
  // //         context: context,
  // //         builder: (BuildContext context) {
  // //           return AlertDialog(
  // //             title: Text('태그를 추가하세요.'),
  // //             content: TextFormField(
  // //               onChanged: (value) => tag = value,
  // //               style: TextStyle(
  // //                 fontSize: 12,
  // //               ),
  // //               cursorColor: primary,
  // //               decoration: InputDecoration(
  // //                   contentPadding: EdgeInsets.only(left: 10),
  // //                   enabledBorder: OutlineInputBorder(
  // //                     borderRadius: BorderRadius.circular(0),
  // //                     borderSide: BorderSide(
  // //                       color: primary,
  // //                     ),
  // //                   ),
  // //                   focusedBorder: OutlineInputBorder(
  // //                     borderRadius: BorderRadius.circular(0),
  // //                     borderSide: BorderSide(
  // //                       color: primary,
  // //                     ),
  // //                   ),
  // //                   hintText: ''),
  // //             ),
  // //             actions: [
  // //               FlatButton(
  // //                 onPressed: () => Navigator.pop(context),
  // //                 color: primary,
  // //                 child: Text('취소'),
  // //               ),
  // //               FlatButton(
  // //                 onPressed: () => Navigator.pop(context, tag),
  // //                 color: primary,
  // //                 child: Text('추가'),
  // //               )
  // //             ],
  // //           );
  // //         });
  // //   } on Exception catch (e) {
  // //     _error = e.toString();
  // //   }
  // //
  // //   setState(() {
  // //     _tags.add(Tag(tag));
  // //     _error = _error;
  // //   });
  // // }
  //
  // Widget emptyTagBox(BuildContext context) {
  //   const double _length = 30;
  //
  //   return Material(
  //     child: InkWell(
  //       onTap: () {
  //         loadTags();
  //       },
  //       child: Container(
  //         margin: EdgeInsets.only(left: 20),
  //         width: _length,
  //         height: _length,
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.black),
  //           color: offWhite,
  //         ),
  //         child: Center(
  //           child: Icon(Icons.add),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget tagBox(BuildContext context, Tag tag) {
  //   return Material(
  //     child: InkWell(
  //       child: Container(
  //         margin: EdgeInsets.only(left: 10),
  //         width: tag.title.length * 10 + 30.0,
  //         height: 30,
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.black),
  //           color: offWhite,
  //         ),
  //         child: Stack(
  //           alignment: Alignment.topRight,
  //           children: [
  //             Center(
  //                 child: Center(
  //                   child: Text(tag.title),
  //                 )),
  //             Material(
  //               child: InkWell(
  //                 onTap: () {
  //                   setState(() {
  //                     _tags.remove(tag);
  //                   });
  //                 },
  //                 child: ImageIcon(
  //                   AssetImage(delete_tag_idle),
  //                   size: 12,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget uploadButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            _formKey.currentState.save();
          });

          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 2), () {});
                return AlertDialog(
                  content: Text('선택된 이미지가 없습니다!'),
                );
              });
        },
        child: InkWell(
          onTap: () {
            add();
          },
          child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: Colors.black,
          child: Center(
            child: Text(
              '등록하기',
              style: TextStyle(color: Colors.white),
            ),
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

      setState(() {
        imageURI = List<String>();
      });

      for (int i = 0; i < _images.length; i++) {
        uploadImages(_images[i], i);
        imageURI.add('gs://newnew-beta.appspot.com/product/' +
            widget.user.username +
            '+' +
            'product' +
            widget.user.myProducts.length.toString() +
            '+' +
            i.toString() +
            '.jpg');
      }

      addProduct();
      try {
        Navigator.pop(context);
      } catch (e) {
        print(e.message);
      }
    }
  }

  Future uploadImages(Asset asset, int index) async {
    if (_images == null) return;

    String path = 'product/' +
        widget.user.username +
        '+' +
        'product' +
        widget.user.myProducts.length.toString() +
        '+' +
        index.toString() +
        '.jpg';
    ByteData byteData = await asset.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = ref.putData(imageData);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  Future addProduct() async {
    for (int i = 0; i < _tags.length; i++) {
      tags.add(_tags[i].title);
    }

    Firestore.instance.collection("product").document(firebaseUser.uid).setData({
      'uid': firebaseUser.uid,
      'username': _nameTextEditController.text.trim(),
      'password': _passwordTextEditController.text.trim(),
      'eMail': firebaseUser.email,
      'imageURI': userImgUrl,
      'bio': '',
      'followers': List<String>(),
      'following': List<String>(),
      ArtpiaConfig.userCartList: ['init'],
    });
  }
}
