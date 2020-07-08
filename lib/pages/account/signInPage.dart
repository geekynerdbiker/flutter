import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/account/findPassword.dart';
import 'package:bak/pages/account/selectFavor.dart';
import 'package:bak/pages/account/signUpPage.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String account;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '로그인'),
      backgroundColor: offWhite,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
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
            textFieldAccount(context),
            textFieldPassword(context),
            hSpacer(20),
            signInButton(context),
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

  Widget textFieldAccount(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        validator: (value) {
          if(value.isEmpty)
            return '상점명 또는 이메일을 입력하세요.';
          return null;
        },
        onSaved: (value) => account = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '상점명 또는 이메일'),
      ),
    );
  }

  Widget textFieldPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          if(value.isEmpty)
            return '비밀번호를 입력하세요.';
          return null;
        },
        onSaved: (value) => password = value,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '비밀번호'),
      ),
    );
  }

  Widget signInButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: signIn,
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text(
              '로그인',
              style: label(offWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final FormState formState = _formKey.currentState;
    _autoValidate = true;

    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: account, password: password)).user;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BootPage()), (route) => false);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
