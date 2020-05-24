import 'package:flutter/material.dart';
import 'package:newnew/pages/forYou/collectionDetailPage.dart';
import 'package:newnew/pages/forYou/userCollectionPage.dart';
import 'package:newnew/pages/etc/popularSeller.dart';
import 'package:newnew/pages/product/productDetail.dart';
import 'package:newnew/pages/product/productList.dart';
import 'package:newnew/pages/category/mainPage.dart';

import 'pages/home/mainPage.dart';
import 'pages/forYou/mainPage.dart';
import 'pages/profile/mainPage.dart';
import 'pages/product/productList.dart';
import 'pages/product/productDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/pl': (context) => ProductList(),
        '/cl': (context) => UserCollectionPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    CollectionPage(),
    PopularSellerPage(),
    CategoryPage(),
    ProfilePage(),
  ];
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: pages,
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
