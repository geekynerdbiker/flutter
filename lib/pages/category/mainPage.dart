import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/category/category.dart';
import 'package:bak/pages/category/favor.dart';
import 'package:flutter/material.dart';

class CategoryMainPage extends StatefulWidget {
  @override
  _CategoryMainPage createState() => _CategoryMainPage();
}
class _CategoryMainPage extends State<CategoryMainPage> with TickerProviderStateMixin {
  TabController _controller;
  List<Tab> _tabs = [
    Tab(icon: Text('카테고리'),),
    Tab(icon: Text('취향'),),
  ];
  List<Widget> _pages = [
    CategoryPage(),
    FavorPage(),
  ];

  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithTabDeep(context, 'Category', _tabs, _controller),
      body: TabBarView(
        controller: _controller,
        children: _pages,
      ),
    );
  }
}