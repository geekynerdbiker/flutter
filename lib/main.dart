import 'package:flutter/material.dart';

import 'package:newnew/pages/forYou/userCollectionPage.dart';
import 'package:newnew/pages/etc/popularSeller.dart';
import 'package:newnew/pages/product/addProductPage.dart';

import 'package:newnew/pages/product/productListPage.dart';
import 'package:newnew/pages/category/mainPage.dart';


import 'pages/home/mainPage.dart';
import 'pages/forYou/mainPage.dart';
import 'pages/profile/mainPage.dart';
import 'pages/product/productListPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget> [
            HomePage(),
            CollectionPage(),
            AddProductPage(),
            CategoryPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          child: new TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.view_headline),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
