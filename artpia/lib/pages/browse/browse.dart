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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Category', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: Colors.blue,
        ),
      ],
    );
  }
}
