import 'package:flutter/material.dart';
import 'package:newnew/pages/cart/mainPage.dart';
import 'pages/collection/mainPage.dart';
import 'pages/home/mainPage.dart';
import 'pages/cart/mainPage.dart';
import 'pages/profile/mainPage.dart';
import 'pages/product/productList.dart';

//import 'models/appbar.dart';

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
  List<Widget> pages = [
    HomePage(),
    CollectionPage(),
    ProductList(),
    ProfilePage()
  ];
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                icon: Icon(Icons.view_headline),
              ),
              Tab(
                icon: Icon(Icons.favorite),
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
