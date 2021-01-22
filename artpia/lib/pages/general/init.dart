import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/general/home/home.dart';
import 'package:artpia/pages/general/browse/browse.dart';
import 'package:artpia/pages/general/messege/messege.dart';
import 'package:artpia/pages/general/profile/profile.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
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
      ),
    );
  }
}
