import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
            child: Text('회원가입', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                    width: MediaQuery.of(context).size.width - 190,
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 3),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 12,),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '전화번호 입력'),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                    height: 40,
                    width: 80,
                    color: Colors.black,
                    child: Center(
                      child: Text('인증요청', style: TextStyle(fontSize:12, color: Colors.white),),
                    )
                ),
              ],
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
                        border: InputBorder.none, hintText: '인증번호 입력'),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.all(15),
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
                        border: InputBorder.none, hintText: '사용자명 입력(영문)'),
                  ),
                )
            ),
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width - 100,
              child: Text('추후 변경할 수 있습니다.', style: TextStyle(fontSize: 11, color: Colors.grey),),
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
                        border: InputBorder.none, hintText: '이메일 입력'),
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
                        border: InputBorder.none, hintText: '비밀번호 입력'),
                  ),
                )
            ),
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width - 100,
              child: Text('8 - 16자의 영문, 숫자 조합', style: TextStyle(fontSize: 11, color: Colors.grey),),
            ),
            Padding(
              padding: EdgeInsets.all(40),
            ),
            Container(
              height: 40,
              width: 120,
              color: Colors.black,
              child: Center(
                child: Text(
                  '가입하기',
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
                  width: 130,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '이미 계정이 있으신가요?',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
