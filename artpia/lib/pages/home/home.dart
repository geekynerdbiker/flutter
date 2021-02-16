import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/home/modules.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // GridView.builder(gridDelegate: null, itemBuilder: null)
            Row(
              children: [item(context), item(context)],
            ),
            Row(
              children: [item(context), item(context)],
            ),
            Row(
              children: [item(context), item(context)],
            ),
            Row(
              children: [item(context), item(context)],
            ),
          ],
        ),
      ),
    );
  }
}

Widget items(BuildContext context) {
  return GridView.builder(gridDelegate: null, itemBuilder: null);
}

Widget item(BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.blue)),
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.width / 2 - 30,
        // child: Image()
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: 30,
        child: Text(
          '[' + 'product title' + ']',
          style: TextStyle(fontWeight: FontWeight.w700),
          textAlign: TextAlign.start,
        ),
      )
    ],
  );
}
