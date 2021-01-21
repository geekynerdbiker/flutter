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
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(initialIndex: selectedIndex, vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> _tabs = [
      Tab(
        icon: Text(
            '나의 샵' + ' (' + widget.user.myProducts.length.toString() + ')'),
      ),
      Tab(
        icon: Text('나의 컬렉션' +
            ' (' +
            widget.user.myCollections.length.toString() +
            ')'),
      ),
    ];

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
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
          child: Column(
        children: <Widget>[
          userMarqueeMyPage(context, widget.user),
          historyButton(context),
          TabBar(
            controller: _controller,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: _tabs,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                _controller.animateTo(index);
              });
            },
          ),
          IndexedStack(
            children: <Widget>[
              Visibility(
                child: MyShopPage(
                  user: widget.user,
                ),
                maintainState: true,
                visible: selectedIndex == 0,
              ),
              Visibility(
                child: MyCollectionPage(
                  user: widget.user,
                ),
                maintainState: true,
                visible: selectedIndex == 1,
              ),
            ],
            index: selectedIndex,
          ),
        ],
      )),
    );
  }
}
