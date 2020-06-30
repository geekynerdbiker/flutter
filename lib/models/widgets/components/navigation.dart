import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/pages/favorite/mainPage.dart';
import 'package:editsource/pages/notification/mainPage.dart';
import 'package:flutter/material.dart';

Widget mainAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset(
          'lib/assets/icons/drawable-xxxhdpi/new_new_logo_horizontal.png'),
    ),
    actions: <Widget>[notification(context), favorite(context)],
  );
}

Widget appBarDefault(BuildContext context, String _title) {
  return AppBar(
    elevation: 0,
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
    elevation: 0,
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
    elevation: 0,
    centerTitle: true,
    backgroundColor: offWhite,
    title: Text(
      _title,
      style: TextStyle(color: Colors.black),
    ),
    leading: BackButton(color: Colors.black),
  );
}

Widget appBarWithskip(BuildContext context, String _title, Widget _skipRoute) {
  return AppBar(
    backgroundColor: offWhite,
    elevation: 0,
    centerTitle: true,
    title: Container(
      child: Text(
        _title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
    leading: BackButton(
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      Container(
        child: Material(
          color: offWhite,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => _skipRoute));
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
    elevation: 0,
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

Widget notification(BuildContext context) {
  return Material(
    color: offWhite,
    child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 24,
          height: 24,
          child: Image.asset(
              'lib/assets/icons/drawable-xxxhdpi/24_px_notification_idle.png'),
        )),
  );
}

Widget favorite(BuildContext context) {
  return Material(
    color: offWhite,
    child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavoritePage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: 24,
          height: 24,
          child: Image.asset(
              'lib/assets/icons/drawable-xxxhdpi/24_px_favorite_idle.png'),
        )),
  );
}
