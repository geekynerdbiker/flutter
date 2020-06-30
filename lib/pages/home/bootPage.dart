import 'package:editsource/models/designs/colors.dart';
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
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: offWhite,
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
            labelColor: accent1,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: primary,
            tabs: [
              Tab(
                icon: ImageIcon(AssetImage('lib/assets/icons/drawable-xxxhdpi/tab_bar_home_idle.png')),
              ),
              Tab(
                icon: ImageIcon(AssetImage(
                    'lib/assets/icons/drawable-xxxhdpi/tab_bar_discover_idle.png'),
                ),),
              Tab(
                icon: ImageIcon(AssetImage(
                    'lib/assets/icons/drawable-xxxhdpi/tab_bar_new_item_idle.png'),
              ),),
              Tab(
                icon: ImageIcon(AssetImage(
                    'lib/assets/icons/drawable-xxxhdpi/tab_bar_message_idle.png'),
              ),),
              Tab(
                icon: ImageIcon(AssetImage(
                    'lib/assets/icons/drawable-xxxhdpi/tab_bar_my_page_idle.png'),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
