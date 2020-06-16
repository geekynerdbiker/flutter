import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/searchBar.dart';

Widget mainAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      width: MediaQuery.of(context).size.width * 1 / 2,
      child: Image.asset('lib/assets/newnew_logo.png'),
    ),
    bottom: PreferredSize(
      preferredSize: Size(0, 40),
      child: Container(
        padding: EdgeInsets.all(5),
        child: SearchBar(),
      ),
    ),
    actions: <Widget>[
      Container(
        child: Material(
          color: Colors.white,
          child: InkWell(
            child: Icon(
              Icons.message,
              color: Colors.grey,
              size: 22,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Material(
          color: Colors.white,
          child: InkWell(
            child: Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 22,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget appBarDefault(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

Widget appBarWithTab(BuildContext context, String title, List<Tab> _tabs, TabController _controller) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        title,
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

Widget appBarDefaultDeep(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    leading: BackButton(color: Colors.black),
  );
}

Widget appBarWithTabDeep(BuildContext context, String title, List<Tab> _tabs, TabController _controller) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        title,
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
