import 'package:flutter/material.dart';

import 'package:artpia/pages/general/home/modules.dart';

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

          ],
        ),
    );
  }
}

Widget items(BuildContext context) {
  return GridView.builder(gridDelegate: null, itemBuilder: null);
}
