import 'package:editsource/pages/home/homePage.dart';
import 'package:editsource/pages/message/mainPage.dart';
import 'package:editsource/pages/newnew/mainPage.dart';
import 'package:editsource/pages/product/addProductPage.dart';
import 'package:editsource/pages/profile/mainPage.dart';
import 'package:flutter/material.dart';

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
          children: <Widget>[
            HomePage(),
            NewnewPage(),
            AddProductPage(),
            MessagePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          child: new TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
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
                icon: Icon(Icons.message),
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
