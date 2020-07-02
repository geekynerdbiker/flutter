import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/newnew/follwingCollections.dart';
import 'package:editsource/pages/newnew/follwingShops.dart';
import 'package:editsource/pages/newnew/recommend.dart';
import 'package:flutter/material.dart';

class NewnewPage extends StatefulWidget {
  @override
  _NewnewPageState createState() => _NewnewPageState();
}

class _NewnewPageState extends State<NewnewPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('추천'),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: offWhite,
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
