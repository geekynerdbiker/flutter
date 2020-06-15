import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/pages/account/changePassword.dart';
import 'package:newnew/pages/account/signInPage.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '비밀번호 찾기'),
      backgroundColor: Colors.white,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 40,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 190,
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '전화번호 입력'),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                    height: 40,
                    width: 80,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        '인증요청',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
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
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '인증번호 입력'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(5),
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
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '이메일 입력'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => ChangePasswordPage()));
                },
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '다음으로',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 130,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '이미 계정이 있으신가요?',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 20,
                      width: 40,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          '로그인',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
