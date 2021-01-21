import 'package:flutter/material.dart';

import 'package:artpia/pages/home/profile/modules.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
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
