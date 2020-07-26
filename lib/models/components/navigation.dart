import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/search.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/category/mainPage.dart';
import 'package:bak/pages/favorite/mainPage.dart';
import 'package:bak/pages/notification/mainPage.dart';
import 'package:bak/pages/setting/mainPage.dart';
import 'package:flutter/material.dart';

Widget mainAppBar(BuildContext context, User user) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset(
          'lib/assets/icons/drawable-xxxhdpi/new_new_logo_horizontal.png'),
    ),
    leading: Material(
      child: InkWell(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryMainPage()));
        },
        child: ImageIcon(AssetImage(category_idle), color: primary),
      ),
    ),
    actions: <Widget>[notification(context, user), favorite(context, user)],
  );
}

Widget appBarWithSearch(BuildContext context, String _title, User user,
    List<Tab> _tabs, TabController _controller) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset(
          'lib/assets/icons/drawable-xxxhdpi/new_new_logo_horizontal.png'),
    ),
    leading: Material(
      child: InkWell(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryMainPage()));
        },
        child: ImageIcon(AssetImage(category_idle), color: primary),
      ),
    ),
    actions: <Widget>[notification(context, user), favorite(context, user)],
    bottom: PreferredSize(
      preferredSize: Size(0, 40),
      child: Container(
          padding: EdgeInsets.all(5),
          child: Material(
            child: InkWell(
              child: searchBarDisable(context),
            ),
          )),
    ),
  );
}

Widget appBarDefault(BuildContext context, String _title) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      child: Text(
        _title,
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

Widget appBarWithTab(BuildContext context, String _title, List<Tab> _tabs,
    TabController _controller) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      child: Text(
        _title,
        style: TextStyle(color: Colors.black),
      ),
    ),
    bottom: TabBar(
      controller: _controller,
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: _tabs,
    ),
  );
}

Widget appBarDefaultDeep(BuildContext context, String _title) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Text(
      _title,
      style: TextStyle(color: Colors.black),
    ),
    leading: BackButton(color: Colors.black),
  );
}

Widget appBarWithSkip(BuildContext context, String _title, Widget _skipRoute) {
  return AppBar(
    backgroundColor: offWhite,
    elevation: 0.5,
    centerTitle: true,
    title: Container(
      child: Text(
        _title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
    actions: <Widget>[
      Container(
        child: Material(
          color: offWhite,
          child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => _skipRoute),
                    (route) => false);
              },
              child: Container(
                padding: EdgeInsets.only(top: 15),
                width: 60,
                child: Text('건너뛰기'),
              )),
        ),
      ),
    ],
  );
}

Widget appBarWithTabDeep(BuildContext context, String _title, List<Tab> _tabs,
    TabController _controller) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      child: Text(
        _title,
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: BackButton(color: Colors.black),
    bottom: TabBar(
      controller: _controller,
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: _tabs,
    ),
  );
}

Widget category(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryMainPage()));
        },
        child: ImageIcon(
          AssetImage(category_idle),
          color: primary,
          size: 12,
        ),
      ),
    ),
  );
}

Widget notification(BuildContext context, User user) {
  return Material(
    color: offWhite,
    child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 28,
          height: 24,
          child: Image.asset(
              'lib/assets/icons/drawable-xxxhdpi/24_px_notification_idle.png'),
        )),
  );
}

Widget favorite(BuildContext context, User user) {
  return Material(
    color: offWhite,
    child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FavoritePage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 28,
          height: 24,
          child: Image.asset(
              'lib/assets/icons/drawable-xxxhdpi/24_px_favorite_idle.png'),
        )),
  );
}

Widget chat(BuildContext context, User _user) {
  return AppBar(
    elevation: 0.5,
    //centerTitle: true,
    backgroundColor: offWhite,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: profileImage(context, _user, 20),
        ),
        Text(
          _user.username,
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    leading: Material(
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ImageIcon(
              AssetImage(back_idle),
              size: 8,
              color: primary,
            ),
          )),
    ),
    actions: [
      Material(
        child: InkWell(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: ImageIcon(
            AssetImage(more_idle),
            size: 24,
            color: primary,
          ),
        )),
      ),
    ],
  );
}

Widget myPage(BuildContext context, User user) {
  return AppBar(
    elevation: 0.5,
    //centerTitle: true,
    backgroundColor: offWhite,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          user.username,
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    leading: Material(
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage(user: user)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ImageIcon(
              AssetImage(setting_idle),
              size: 8,
              color: primary,
            ),
          )),
    ),
    actions: <Widget>[notification(context, user), favorite(context, user)],
  );
}
