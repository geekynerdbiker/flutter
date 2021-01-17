import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/newnew/follwingCollections.dart';
import 'package:bak/pages/newnew/follwingShops.dart';
import 'package:bak/pages/newnew/recommend.dart';
import 'package:flutter/material.dart';import 'package:firebase_auth/firebase_auth.dart';

class SearchResultPage extends StatefulWidget {
  User user;
  final String search;
  SearchResultPage({this.user, this.search});

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('product'),
    ),
    Tab(
      icon: Text('shop'),
    ),
    Tab(
      icon: Text('collection'),
    ),
  ];
  List<Widget> pages = [
    RecommendPage(),
    FollowingShopsPage(),
    FollowingCollectionsPage(),
  ];

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
    return Scaffold(
        backgroundColor: offWhite,
        body: Column(
          children: [
            TabBar(
              controller: _controller,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: _tabs,
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: pages,
              ),
            )
          ],
        ));
  }
}
