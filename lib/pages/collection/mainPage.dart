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
            elevation: 0.75,
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black,),
                        onPressed: () {},
                      ),
                      Text('컬렉션', style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ],
              ),
            ),

            bottom: TabBar(
              controller: _controller,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Text('기획전'),
                ),
                Tab(
                  icon: Text('컬렉션'),
                ),
                Tab(
                  icon: Text('피드'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _controller,
            children: pages,
          ),
        ),
      ),
    );
  }
}