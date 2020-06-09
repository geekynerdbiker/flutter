import 'package:flutter/material.dart';
import 'package:newnew/testInput.dart';
import 'package:newnew/widgets/category/listCategory.dart';

import 'package:newnew/widgets/category/squareList(2in1).dart';
import 'package:newnew/widgets/etc/searchBar.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Widget> pages = [
    ListCategory(categoryItems),
    SquareList2in1(),
    ListCategory(categoryItems),
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
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Container(
                child: Text(
                  '카테고리',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: Size(0, 50),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: SearchBar(),
                      ),
                    ],
                  )),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child: TabBar(
                    controller: _controller,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        icon: Text('일반'),
                      ),
                      Tab(
                        icon: Text('취향'),
                      ),
                      Tab(
                        icon: Text('서비스'),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 226,
                  child: TabBarView(
                    controller: _controller,
                    children: pages,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
