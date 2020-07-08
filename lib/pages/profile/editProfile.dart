import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  TextEditingController usernameController;
  TextEditingController nameController;
  TextEditingController webSiteController;
  TextEditingController bioController;

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
              child: profileImage(new User('username', '1', 'imageURI'), 84),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            //child: textField(context, '상점명', usernameController, validator1),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            //child: textField(context, '이름', nameController),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            //child: textField(context, '웹사이트 (선택)', webSiteController),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            //child: textFieldLarge(context, '소개', bioController)
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //child: longButtonPop(context, primary, false, Text('확인', style: TextStyle(color: offWhite),))
          ),
        ],
      ),
    );
  }
}