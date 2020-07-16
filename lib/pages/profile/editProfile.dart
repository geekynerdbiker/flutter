import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/profile/mainPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfilePage extends StatefulWidget {
  User user;

  EditProfilePage({this.user});

  _EditProfilePage createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String username;
  String name;
  String webSite;
  String bio;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '프로필 수정'),
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: profileImage(widget.user, 84),
              ),
            ),
            textFieldUsername(context),
            textFieldName(context),
            textFieldWebsite(context),
            longTextField(context),
            confirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget textFieldUsername(BuildContext context) {
    //tag
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) {
          username = value;
        },
        validator: (value) {
          if (value.isEmpty) return '상점명을 입력하세요.';
          return null;
        },
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '상점명'),
      ),
    );
  }

  Widget textFieldName(BuildContext context) {
    //tag
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => name = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '이름 (선택)'),
      ),
    );
  }

  Widget textFieldWebsite(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => webSite = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '웹사이트 (선택)'),
      ),
    );
  }

  Widget longTextField(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 88,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => bio = value,
        maxLines: 5,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            border: InputBorder.none,
            hintText: '상점 소개 (선택)'),
      ),
    );
  }

  Widget confirmButton(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            _autoValidate = true;
            _formKey.currentState.save();
            updateEdit();
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text(
              '확인',
              style: TextStyle(color: offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateEdit() async {
    setState(() {
      if (_formKey.currentState.validate()) {
        save();
      }
    });
  }

  void save() {
    Firestore.instance.collection('users').document(username).setData(
        {
          'username': username,
          'password': widget.user.password,
          'contact': widget.user.contact,
          'eMail': widget.user.eMail,
          'address': widget.user.address,
          'createDate': widget.user.createDate,
          'lastActivity': widget.user.lastActivity,
          'rate': widget.user.rate,
          'imageURI': widget.user.imageURI,
          'name': name,
          'bio': bio,
          'webSite': webSite,
          'followers': widget.user.followers,
          'following': widget.user.following,
          'selectedFavor': widget.user.selectedFavor,
          'reviews': widget.user.reviews,
          'favorite': widget.user.favorite,
          'myProducts': widget.user.myProducts,
          'myCollections': widget.user.myCollections,
        });
    print(username);
    Firestore.instance.collection('users')
        .document(widget.user.username)
        .delete();

    Firestore.instance.collection('users').document(username).get().then((e) {
      Navigator.pop(context, User.getUserData(e));
      initState();
    });
  }
}
