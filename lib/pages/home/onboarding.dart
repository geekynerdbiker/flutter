import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/pages/home/account/signInPage.dart';
import 'package:bak/pages/home/account/signUpPage.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          explore(context),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.25,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              '취향있는 사람들의\n좋은 물건\nNEW NEW',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.65),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    basicButton(context, '로그인', SignInPage()),
                    basicButton(context, '회원가입', SignUpPage()),
                  ],
                ),
                hSpacer(70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    foreignLogInButton(context, '네이버 로그인', Colors.green),
                    foreignLogInButton(context, '카카오 로그인', Colors.yellow),
                  ],
                ),
                hSpacer(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    foreignLogInButton(context, 'Facebook 로그인', Colors.blue),
                    foreignLogInButton(context, 'Google 로그인', offWhite),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget explore(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20, top: 80),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BootPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 40,
              child: Center(
                child: Text(
                  '둘러보기',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget basicButton(BuildContext context, String textContext, Widget _route) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _route));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (158 / 375),
          height: 40,
          decoration: BoxDecoration(
              color: offWhite, border: Border.all(color: primary)),
          child: Center(
            child: Text(
              textContext,
              style: TextStyle(color: primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget foreignLogInButton(BuildContext context, String textContext, Color _color) {
    return Material(
      child: InkWell(
//        onTap: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => _route));
//        },
        child: Container(
          width: MediaQuery.of(context).size.width * (158 / 375),
          height: 40,
          decoration: BoxDecoration(
              color: _color),
          child: Center(
            child: Text(
              textContext,
              style: TextStyle(color: primary),
            ),
          ),
        ),
      ),
    );
  }
}
