import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzone/page/user/club/club.dart';
import 'package:mzone/page/user/home/home.dart';
import 'package:mzone/page/user/mypage/user.dart';
import 'package:mzone/page/user/place/place.dart';

class InterfacePage extends StatefulWidget {
  const InterfacePage({Key? key}) : super(key: key);

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

    int initialIndex = 0;

    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            ClubPage(),
            // PlacePage(),
            UserPage(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: height * 0.1,
          child: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.home),
              ),
              Tab(
                icon: Icon(CupertinoIcons.group),
              ),
              // Tab(
              //   icon: Icon(CupertinoIcons.placemark),
              // ),
              Tab(
                icon: Icon(CupertinoIcons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
