import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/home/home.dart';
import 'package:artpia/pages/browse/browse.dart';
import 'package:artpia/pages/messege/messege.dart';
import 'package:artpia/pages/profile/profile.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomePage(),
              BrowsePage(),
              MessegePage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 80,
            child: new TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Icon(CupertinoIcons.home),
                  text: ' ',
                  iconMargin: EdgeInsets.only(bottom: 10),
                  //ImageIcon(AssetImage('tab_bar_home')),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.search),
                  text: ' ',
                  iconMargin: EdgeInsets.only(bottom: 10),

                  //ImageIcon(AssetImage('tab_bar_discover'),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.conversation_bubble),
                  text: ' ',
                  iconMargin: EdgeInsets.only(bottom: 10),

                  //ImageIcon(AssetImage('tab_bar_message'),
                  ),
                Tab(
                  icon: Icon(CupertinoIcons.person),
                  text: ' ',
                  iconMargin: EdgeInsets.only(bottom: 10),
                  //ImageIcon(AssetImage('tab_bar_my_page'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
