import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/profile/myCollectionPage.dart';
import 'package:editsource/pages/profile/myShopPage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('나의 샵' + ' ('+'42'+ ')'),
    ),
    Tab(
      icon: Text('나의 컬렉션' + ' ('+'9'+')'),
    ),
  ];

  List<Widget> _pages = [
    MyShopPage(user: new User('username', 1, 'imageURI'),),
    MyCollectionPage(user: new User('username', 1, 'imageURI'),),
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
    return Scaffold(
      backgroundColor: offWhite,
      appBar: appBarDefault(context, '내 정보'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          userMarqueeMyPage(context, new User('username', 1, 'imageURI')),
          Container(
            margin: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
            child: primaryCTAIdle(context, '구매/판매 내역'),
          ),
          TabBar(
            controller: _controller,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: _tabs
          ),
          Container(
            height: 500,
            child: TabBarView(
              controller: _controller,
              children: _pages
            ),
          )
        ],
      ),
    );
  }
}
