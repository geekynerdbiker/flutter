import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:bak/pages/product/addProductPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class EditCollectionPage extends StatefulWidget {
  User user;
  Collection collection;

  EditCollectionPage({this.user, this.collection});

  @override
  _EditCollectionPage createState() => _EditCollectionPage();
}

class _EditCollectionPage extends State<EditCollectionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  List<Asset> _images = List<Asset>();

  String userID;

  String title;
  String imageURI;
  String description = '컬렉션 설명이 없습니다.';

  List<String> products = List<String>();
  List<String> followers = List<String>();
  List<String> tags = List<String>();

  bool canJoin = false;
  bool private = false;

  @override
  void initState() {
    userID = widget.collection.userID;

    title = widget.collection.title;
    imageURI = widget.collection.imageURI;
    description = widget.collection.description;

    products = widget.collection.products;
    followers = widget.collection.followers;
    tags = widget.collection.tags;

    canJoin = widget.collection.canJoin;
    private = widget.collection.private;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '컬렉션 추가'),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            imagePicker(context),
            textFieldTitle(context),
            longTextField(context),
            makeCollectionPrivate(context),
            acceptParticipate(context),
            uploadButton(context),
          ],
        ),
      ),
    );
  }

  Widget imagePicker(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          loadAssets();
        },
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .width * (280 / 375),
          color: Colors.grey,
          child: (_images?.isEmpty ?? true)
              ? null
              : AssetThumb(
            asset: _images[0],
            quality: 100,
            width: _images[0].originalWidth,
            height: _images[0].originalHeight,
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
        maxImages: 1,
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
      _images = resultList;
      _error = _error;
    });
  }

  Widget textFieldTitle(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) return '컬렉션 제목을 입력하세요.';
          return null;
        },
        onSaved: (value) => title = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '컬렉션 이름'),
      ),
    );
  }

  Widget longTextField(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * (335 / 375),
      height: 176,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => description = value,
        maxLines: 5,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            border: InputBorder.none,
            hintText: '컬렉션 설명 (선택)'),
      ),
    );
  }

  Widget makeCollectionPrivate(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36, bottom: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('이 컬렉션을 비공개로 하기'),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              activeColor: primary,
              value: private,
              onChanged: (value) {
                setState(() {
                  private = !private;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget acceptParticipate(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 35, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('다른 유저들의 참여를 허용하기'),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              activeColor: primary,
              value: canJoin,
              onChanged: (value) {
                setState(() {
                  canJoin = !canJoin;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if( _images?.isEmpty ?? true )
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                content: Text('선택된 이미지가 없습니다!'),
              );
            });
          else
           edit();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery
              .of(context)
              .size
              .width * (335 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text(
              '컬렉션 추가',
              style: label(offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> edit() async {
    _autoValidate = true;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      uploadImages(_images[0]);
      imageURI = ('gs://newnew-beta.appspot.com/collection/' +
          widget.user.username +
          '+' +
          'collection' +
          widget.user.myCollections.length.toString() +
          '.jpg');
    }

    editCollection();
    try {
      showDialog(context: context, builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
       return AlertDialog(
          content: Text('\'' + title +'\'' + '컬렉션이 수정되었습니다!'),
        );
      });

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CollectionDetailPage(
                    user: widget.user,
                    collection: widget.collection,
                  )),
              (route) => false);
    } catch (e) {
      print(e.message);
    }
  }

  Future uploadImages(Asset asset) async {
    if (_images == null) return;

    String path = 'collection/' +
        widget.user.username +
        '+' +
        'collection' +
        widget.user.myCollections.length.toString() +
        '.jpg';
    ByteData byteData = await asset.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();
    StorageReference ref = FirebaseStorage.instance.ref().child(path);
    StorageUploadTask uploadTask = ref.putData(imageData);

    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  void editCollection() {
    Firestore.instance
        .collection('collections')
        .document(widget.user.username + '+' + title)
        .updateData({
      "title": title,
      "imageURI": imageURI,
      "description": description,
      "canJoin": canJoin,
      "private": private,
    });
  }
}
