import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/testInput.dart';

import 'package:newnew/widgets/product/products.dart';
import 'package:newnew/widgets/product/products2.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Icon(Icons.border_all),
    ),
    Tab(
      icon: Icon(Icons.apps),
    ),
  ];

  List<Widget> pages = [
    Products(productItems),
    Products2(productItems),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
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
        length: 2,
        child: Scaffold(
          floatingActionButton: Container(
            padding: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
                label: Row(
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      " Filter",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                backgroundColor: Colors.white,
                onPressed: () {}),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.white,
          appBar: appBarWithTabDeep(context, '상품 목록', _tabs, _controller),
          body: TabBarView(
            controller: _controller,
            children: pages,
          ),
        ),
      ),
    );
  }
}
