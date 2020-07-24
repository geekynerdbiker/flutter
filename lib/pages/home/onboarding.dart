import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/account/signInPage.dart';
import 'package:bak/pages/account/signUpPage.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  PageController _controller;

  List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
  ];
  int page = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDone = page == _pages.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: ClampingScrollPhysics(),
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
            onPageChanged: (int p) {
              setState(() {
                page = p;
              });
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.8,
            left: MediaQuery.of(context).size.width * 0.01,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    page--;
                  });
                },
                child: ImageIcon(AssetImage(back_idle), size: 60,),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.8,
            right: MediaQuery.of(context).size.width * 0.01,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    page++;
                  });
                },
                child: ImageIcon(AssetImage(forward_idle), size: 60,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.asset(
        'lib/assets/onboarding/onboarding1.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Image.asset(
        'lib/assets/onboarding/onboarding2.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'lib/assets/onboarding/onboarding3.png',
            fit: BoxFit.cover,
          ),
        ),
        explore(context),
        Positioned(
          top: MediaQuery.of(context).size.width * 0.35,
          left: MediaQuery.of(context).size.width * 0.6,
          child: Text('즐거운 쓸모,\n수집의 기쁨', style: title1(primary)),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.65),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  basicButton(context, '로그인', SignInPage()),
                  basicButton(context, '회원가입', SignUpPage()),
                ],
              ),
              hSpacer(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  foreignLogInButton(context, '네이버 로그인', Colors.green),
                  foreignLogInButton(context, '카카오 로그인', Colors.yellow),
                  foreignLogInButton(context, '애플 로그인', Colors.black),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget explore(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BootPage()));
          },
          child: Container(
            margin: EdgeInsets.only(right: 20, top: 80),
            width: MediaQuery.of(context).size.width * 0.2,
            height: 40,
            child: Center(
              child: Text(
                '둘러보기',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
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
              style: cta(primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget foreignLogInButton(
      BuildContext context, String textContext, Color _color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
//        onTap: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => _route));
//        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 40,
          decoration: BoxDecoration(color: _color),
          child: Center(
            child: Text(
              textContext,
              style: cta(offWhite),
            ),
          ),
        ),
      ),
    );
  }
}
