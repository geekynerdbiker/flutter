import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
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
              child: profileImage(new User('username', 1, 'imageURI'), 84),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: textField(context, '상점명'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: textField(context, '이름'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: textField(context, '웹사이트 (선택)'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: textFieldLarge(context, '소개')
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: longButtonPop(context, primary, false, Text('확인', style: TextStyle(color: offWhite),))
          ),
        ],
      ),
    );
  }
}