import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/account/signInPage.dart';
import 'package:flutter/material.dart';
import 'package:bak/models/components/navigation.dart';


class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '비밀번호 찾기'),
      backgroundColor: offWhite,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
            ),
            Container(
              height: 15,
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 100,
              child: Text(
                '비밀번호를 재설정 해주세요.',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Container(
                height: 40,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 100,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 3),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '신규 비밀번호 (8-20자 내외)'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Container(
                height: 40,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 100,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 3),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '신규 비밀번호 확인'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '비밀번호 변경',
                      style: TextStyle(fontSize: 14, color: offWhite),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
              height: 20,
              width: 130,
              color: offWhite,
              child: Center(
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
