import 'package:flutter/material.dart';

import 'package:artpia/pages/home/home/modules.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.green,
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.pink,
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.blue,
            ),
          ],
        ),
    );
  }
}
