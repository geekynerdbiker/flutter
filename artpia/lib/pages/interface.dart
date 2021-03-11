import 'package:artpia/assets/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/home/home.dart';
import 'package:artpia/pages/browse/browse.dart';
import 'package:artpia/pages/message/message.dart';
import 'package:artpia/pages/profile/profile.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        // floatingActionButton: addProductFAT(context),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            BrowsePage(),
            MessagePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          height: _height * 0.1,
          child: new TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.home),
                //ImageIcon(AssetImage('tab_bar_home')),
              ),
              Tab(
                icon: Icon(CupertinoIcons.search),
                //ImageIcon(AssetImage('tab_bar_discover'),
              ),
              Tab(
                icon: Icon(CupertinoIcons.conversation_bubble),
                //ImageIcon(AssetImage('tab_bar_message'),
              ),
              Tab(
                icon: Icon(CupertinoIcons.person),
                //ImageIcon(AssetImage('tab_bar_my_page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
