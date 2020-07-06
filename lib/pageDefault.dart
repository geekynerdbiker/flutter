import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:flutter/material.dart';

class PageNameHere extends StatefulWidget {
  @override
  _PageNameHere createState() => _PageNameHere();
}

class _PageNameHere extends State<PageNameHere> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: offWhite,
        appBar: appBarDefault(context, 'Messages'),
        body: Container(),
      ),
    );
  }
}
