import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';

import 'package:newnew/widgets/forYou/Recommends.dart';
import 'package:newnew/widgets/collection/userCollections.dart';

class ForYouPage extends StatefulWidget {
  @override
  _ForYouPageState createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('Recommends'),
    ),
    Tab(
      icon: Text('컬렉션'),
    ),
  ];
  List<Widget> pages = [
    Recommends(),
    UserCollections(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarWithTab(context, '포유', _tabs, _controller),
          body: TabBarView(
            controller: _controller,
            children: pages,
          ),
        ),
      ),
    );
  }
}