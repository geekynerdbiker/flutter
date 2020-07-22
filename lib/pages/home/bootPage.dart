import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/home/mainPage.dart';
import 'package:bak/pages/message/mainPage.dart';
import 'package:bak/pages/newnew/mainPage.dart';
import 'package:bak/pages/product/addProductPage.dart';
import 'package:bak/pages/profile/mainPage.dart';
import 'package:flutter/material.dart';

class BootPage extends StatefulWidget {
  User user;
  BootPage({this.user});

  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: offWhite,
          body: TabBarView(
            children: <Widget>[
              HomePage(user: widget.user,),
              NewnewPage(user: widget.user,),
              AddProductPage(user: widget.user,),
              MessagePage(user: widget.user,),
              ProfilePage(user: widget.user,),
            ],
          ),
          bottomNavigationBar: Container(
            child: new TabBar(
              labelColor: accent1,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: primary,
              tabs: [
                Tab(
                  icon: ImageIcon(AssetImage(tab_bar_home)),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(tab_bar_discover),
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(tab_bar_new_item),
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(tab_bar_message),
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage(tab_bar_my_page),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

