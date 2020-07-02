import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/message/chat.dart';
import 'package:editsource/pages/profile/myCollectionPage.dart';
import 'package:editsource/pages/profile/myShopPage.dart';
import 'package:editsource/pages/profile/tradeList.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatefulWidget {
  User _user;

  SellerPage(User _user) {
    this._user = _user;
  }

  @override
  _SellerPageState createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('나의 샵' + ' (' + '42' + ')'),
    ),
    Tab(
      icon: Text('나의 컬렉션' + ' (' + '9' + ')'),
    ),
  ];

  List<Widget> _pages = [
    MyShopPage(
      user: new User('username', 1, 'imageURI'),
    ),
    MyCollectionPage(
      user: new User('username', 1, 'imageURI'),
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
    return Scaffold(
      backgroundColor: offWhite,
      appBar: appBarDefault(context, '내 정보'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          userMarqueeMyPage(context, new User('username', 1, 'imageURI')),
          Container(
            margin: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TradeListPage()));
                    },
                    child: shortButton(context, offWhite, true, Text('팔로우')),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatRoomPage(widget._user)));
                    },
                    child: shortButton(context, offWhite, true, Text('메세지 보내기')),
                  ),
                ),
              ],
            ),
          ),
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
