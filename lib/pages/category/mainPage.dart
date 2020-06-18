import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/testInput.dart';
import 'package:newnew/widgets/category/listCategory.dart';

import 'package:newnew/widgets/category/squareList(2in1).dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('일반'),
    ),
    Tab(
      icon: Text('취향'),
    ),
    Tab(
      icon: Text('서비스'),
    ),
  ];

  List<Widget> _pages = [
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
            appBar: appBarWithTab(context, '카테고리', _tabs, _controller),
            body: Container(
              height: MediaQuery.of(context).size.height - 226,
              child: TabBarView(
                controller: _controller,
                children: _pages,
              ),
            )),
      ),
    );
  }
}
