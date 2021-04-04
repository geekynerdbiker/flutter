import 'package:flutter/material.dart';

import 'package:artpia/pages/browse/module.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: browseAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[categoryPanel(context), recentSearch(context)],
        ),
      ),
    );
  }

  Widget categoryPanel(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Text('category'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [testItem(), testItem(), testItem()],
          ),
        ],
      ),
    );
  }

  Widget recentSearch(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Search'),
              InkWell(
                onTap: () {
                  print("See All");
                },
                child: Text('See All'),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 300,
            child: ListView(
              children: [
                Text('search1'),
                Text('search2'),
                Text('search3'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget testItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 80,
      height: 80,
    );
  }
}
