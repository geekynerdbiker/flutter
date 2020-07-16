import 'package:bak/database/functions.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/pages/profile/myCollectionPage.dart';
import 'package:bak/pages/profile/myShopPage.dart';
import 'package:bak/pages/profile/tradeList.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  User user;
  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('나의 샵' + ' (' + '42' + ')'),
    ),
    Tab(
      icon: Text('나의 컬렉션' + ' (' + '9' + ')'),
    ),
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
    List<Widget> _pages = [
      MyShopPage(
        user: widget.user,
      ),
      MyCollectionPage(
        user: widget.user,
      ),
    ];

    return Scaffold(
      backgroundColor: offWhite,
      appBar: myPage(context, widget.user),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          userMarqueeMyPage(context, widget.user),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TradeListPage()));
                  },
                  child: primaryCTAIdle(context, '구매/판매 내역'),
                ),
              )),
          TabBar(
              controller: _controller,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: _tabs),
          Container(
            height: 500,
            child: TabBarView(controller: _controller, children: _pages),
          )
        ],
      ),
    );
  }
}
