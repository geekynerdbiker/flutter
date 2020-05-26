import 'package:flutter/material.dart';

import 'package:newnew/widgets/forYou/Recommends.dart';
import 'package:newnew/widgets/forYou/collection/userCollections.dart';
import 'package:newnew/widgets/forYou/collection/newnewCollections.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Widget> pages = [
    Recommends(),
    UserCollections(),
    NewnewCollections(),
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
            elevation: 0,
            centerTitle: true,
            title: Container(
              child: Text('For You', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            bottom: TabBar(
              controller: _controller,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Text('Recommends'),
                ),
                Tab(
                  icon: Text('컬렉션'),
                ),
                Tab(
                  icon: Text('기획전'),
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