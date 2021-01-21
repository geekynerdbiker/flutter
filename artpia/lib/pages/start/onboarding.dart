import 'package:flutter/material.dart';

import 'package:artpia/pages/home/init.dart';

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

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                _currentPage = p;
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
                    _currentPage--;
                  });
                },
                child: ImageIcon(
                  AssetImage('back-icon_path'),
                  size: 60,
                ),
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
                    _currentPage++;
                  });
                },
                child: ImageIcon(
                  AssetImage('forward-icon_path'),
                  size: 60,
                ),
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
      ],
    );
  }

  Widget explore(BuildContext context) {
    return Positioned(
      top: 80,
      right: 40,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => InitPage()));
             print("go to init");
          },
          child: Container(
            width: 60,
            height: 20,
              child:Text(
              '둘러보기',
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.underline),
            ),
          ),
        ),
      ),
    );
  }
}
