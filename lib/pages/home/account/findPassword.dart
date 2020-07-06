import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/home/account/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:bak/models/components/navigation.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '비밀번호 찾기'),
      backgroundColor: offWhite,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                shortTextField(context, '전화번호 입력'),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                shortBasicButton(context, '인증요청'),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            textField(context, '인증번호 입력'),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            textField(context, '이메일 입력'),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            basicButton(context, '비밀번호 찾기'),
          ],
        ),
      ),
    );
  }

  Widget shortTextField(BuildContext context, String _textContext) {
    return Container(
        height: 44,
        width: MediaQuery.of(context).size.width * ( 227 / 375 ),
        decoration:
        BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 3),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: _textContext),
          ),
        )
    );
  }

  Widget shortBasicButton(BuildContext context, String _textContext) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width * ( 100 / 375 ),
      color: Colors.black,
      child: Center(
        child: Text(
          _textContext,
          style: TextStyle(fontSize: 14, color: offWhite),
        ),
      ),
    );
  }

  Widget textField(BuildContext context, String _textContext) {
    return Container(
        height: 44,
        width: MediaQuery.of(context).size.width * ( 335 / 375 ),
        decoration:
        BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 3),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: _textContext),
          ),
        )
    );
  }

  Widget basicButton(BuildContext context, String _textContext) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width * ( 335 / 375 ),
      color: Colors.black,
      child: Center(
        child: Text(
          _textContext,
          style: TextStyle(fontSize: 14, color: offWhite),
        ),
      ),
    );
  }
}
