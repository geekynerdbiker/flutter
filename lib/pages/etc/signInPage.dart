import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 300,
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: Icon(
                Icons.desktop_mac,
                size: 50,
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 100,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 3),
                child: TextField(
                  style: TextStyle(
                    fontSize: 12,),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '전화번호, 사용자 이름 또는 이메일'),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 100,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 3),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 12,),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: '비밀번호'),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
              height: 40,
              width: 120,
              color: Colors.black,
              child: Center(
                child: Text(
                  '로그인',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 60,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '아이디 찾기',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Container(
                  height: 10,
                  width: 1,
                  color: Colors.grey,),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Container(
                  height: 20,
                  width: 70,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '비밀번호 찾기',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Container(
                  height: 10,
                  width: 1,
                  color: Colors.grey,),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Container(
                  height: 20,
                  width: 50,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '회원가입',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
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
