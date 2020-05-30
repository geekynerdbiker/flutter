import 'package:flutter/material.dart';
import 'package:newnew/pages/profile/shopPage.dart';
import 'package:newnew/widgets/profile/myCollections.dart';
import 'package:newnew/pages/profile/myCollectionPage.dart';
import 'package:newnew/widgets/profile/reviews.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.75,
            centerTitle: true,
            title: Container(
              child: Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            bottom: TabBar(
              controller: _controller,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Text('상점'),
                ),
                Tab(
                  icon: Text('컬렉션'),
                ),
                Tab(
                  icon: Text('리뷰'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget> [
              ShopPage(),
              MyCollectionPage(),
              Reviews(),
            ],
          ),
        ),
      ),
    );
  }
}