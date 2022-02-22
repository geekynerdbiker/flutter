import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shallcook/page/user/salon/salon.dart';
import 'package:shallcook/page/user/home/home.dart';
import 'package:shallcook/page/user/mypage/user.dart';

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
            SalonPage(),
            UserPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black))),
          height: 65,
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
