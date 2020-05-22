import 'package:flutter/material.dart';
import 'package:newnew/models/user.dart';

import 'package:newnew/widgets/product/products.dart';
import 'package:newnew/widgets/product/products2.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Widget> pages = [
    Products(),
    Products2(),
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
                    Icon(Icons.settings, size: 20, color: Colors.black,),
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
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        '상품',
                        style: TextStyle(color: Colors.black),
                      )
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
                  icon: Icon(Icons.border_all),
                ),
                Tab(
                  icon: Icon(Icons.apps),
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
