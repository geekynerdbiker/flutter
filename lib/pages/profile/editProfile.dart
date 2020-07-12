import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final User user;
  EditProfilePage({this.user});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username;
  String name;
  String website;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '프로필 수정'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              child: profileImage(user, 84),
            ),
          ),
          textFieldUsername(context),
          textFieldName(context),
          textFieldWebsite(context),
          longTextField(context),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //child: longButtonPop(context, primary, false, Text('확인', style: TextStyle(color: offWhite),))
          ),
        ],
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
        onSaved: (value) => username = value,
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
    //tag
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        onSaved: (value) => website = value,
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
        onSaved: (value) => description = value,
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
}