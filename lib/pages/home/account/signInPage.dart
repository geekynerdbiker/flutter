import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:editsource/pages/home/account/findPassword.dart';
import 'package:editsource/pages/home/account/selectFavor.dart';
import 'package:editsource/pages/home/account/signUpPage.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '로그인'),
      backgroundColor: offWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 60),
              width: MediaQuery.of(context).size.width * (124 / 375),
              child: Image.asset(
                'lib/assets/icons/drawable-xxxhdpi/new_new_logo_combined.png',
                fit: BoxFit.cover,
              ),
            ),
            textField(context, '전화번호, 사용자 이름 또는 이메일'),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            textField(context, '비밀번호'),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            basicNavigationButton(context, '로그인', SelectFavorPage()),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textButton(context, '비밀번호 찾기', FindPasswordPage()),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                Container(
                  height: 12,
                  width: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.all(3),
                ),
                textButton(context, '회원가입', SignUpPage()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textField(BuildContext context, String _textContext) {
    return Container(
        height: 44,
        width: MediaQuery.of(context).size.width * (335 / 375),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: EdgeInsets.only(left: 10, bottom: 3),
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: _textContext),
          ),
        ));
  }

  Widget basicButton(BuildContext context, String _textContext) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width * (335 / 375),
      color: Colors.black,
      child: Center(
        child: Text(
          _textContext,
          style: TextStyle(fontSize: 14, color: offWhite),
        ),
      ),
    );
  }

  Widget basicNavigationButton(
      BuildContext context, String _textContext, Widget _route) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _route));
        },
        child: Container(
          height: 44,
          width: MediaQuery.of(context).size.width * (335 / 375),
          color: Colors.black,
          child: Center(
            child: Text(
              _textContext,
              style: TextStyle(fontSize: 14, color: offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Widget textButton(BuildContext context, String _textContext, Widget _route) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _route));
        },
        child: Container(
          height: 20,
          width: 70,
          color: offWhite,
          child: Center(
            child: Text(
              _textContext,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
