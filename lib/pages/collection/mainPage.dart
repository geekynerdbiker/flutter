import 'package:flutter/material.dart';
import 'package:newnew/models/user.dart';

import 'package:newnew/pages/collection/feed.dart';
import 'package:newnew/widgets/collection/mainPage/collections.dart';
import 'package:newnew/widgets/collection/mainPage/userCollection.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Widget> pages = [
    Collections(),
    UserCollections(),
    FeedPage(),
  ];

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
            title: Text('Page', style: TextStyle(color: Colors.black),),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Text('기획전', style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  icon: Text('컬렉션', style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  icon: Text('피드', style: TextStyle(color: Colors.black),),
                ),
              ]
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}