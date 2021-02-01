import 'package:flutter/material.dart';

import 'package:artpia/pages/messege/modules.dart';

class MessegePage extends StatefulWidget {
  @override
  _MessegePageState createState() => _MessegePageState();
}

class _MessegePageState extends State<MessegePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: messegeAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
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
      ),
    );
  }
}
