import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  PageController _controller;

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
      controller: _controller,
      itemCount: pages.length,
      itemBuilder: (BuildContext context, int index) {
        return pages[index % pages.length];
      },
      onPageChanged: (int p) {
        setState(() {
          _page = p;
        });
      },
    );
  }
}
