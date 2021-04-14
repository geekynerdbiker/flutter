import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:artpia/assets/module.dart';

import 'package:artpia/pages/home/home.dart';
import 'package:artpia/pages/search/search.dart';
import 'package:artpia/pages/notification/notification.dart';
import 'package:artpia/pages/profile/profile.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        // floatingActionButton: addArtworkFAT(context),
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            SearchPage(),
            NotificationPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          height: height * 0.1,
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
