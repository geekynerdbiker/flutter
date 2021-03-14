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
          children: <Widget>[
            categoryPanel(context),
          ],
        ),
      ),
    );
  }

  Widget categoryPanel(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [testItem(), testItem(), testItem()],
      ),
    );
  }

  Widget testItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.blue)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 80,
      height: 80,
    );
  }
}
