import 'package:flutter/material.dart';

import 'package:newnew/pages/home/mainPage.dart';
import 'package:newnew/pages/forYou/mainPage.dart';
import 'package:newnew/pages/product/addProductPage.dart';
import 'package:newnew/pages/category/mainPage.dart';
import 'package:newnew/pages/profile/mainPage.dart';


class BootPage extends StatefulWidget {
  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  bool signIn = false;

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
            ForYouPage(),
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