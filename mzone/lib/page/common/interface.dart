import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzone/page/user/club/club.dart';
import 'package:mzone/page/user/home/home.dart';
import 'package:mzone/page/user/mypage/user.dart';
import 'package:mzone/page/user/place/place.dart';
// import 'package:artpia/pages/home/home.dart';
//
// import 'package:artpia/pages/search/search.dart';
// import 'package:artpia/pages/profile/profile.dart';
// import 'package:artpia/pages/profile/artistInfo.dart';
// import 'package:artpia/pages/search/searchResult.dart';
// import 'package:artpia/pages/notification/notification.dart';

class InterfacePage extends StatefulWidget {
  @override
  _InterfacePageState createState() => _InterfacePageState();

  bool artistInfo;
  bool searchResult;
  String searchKeyword;
  InterfacePage({Key key, this.artistInfo = false, this.searchResult = false, this.searchKeyword}) : super(key: key);
}

class _InterfacePageState extends State<InterfacePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    int initialIndex;

    if(widget.artistInfo) initialIndex = 3;
    else if(widget.searchResult) initialIndex = 1;
    else initialIndex = 0;

    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        // floatingActionButton: addArtworkFAT(context),
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            ClubPage(),
            PlacePage(),
            UserPage(),
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
                icon: Icon(CupertinoIcons.group),
                //ImageIcon(AssetImage('tab_bar_discover'),
              ),
              Tab(
                icon: Icon(CupertinoIcons.placemark),
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
