import 'package:editsource/models/widgets/components/navigation.dart';
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
        backgroundColor: Colors.white,
        appBar: appBarDefault(context, 'Messages'),
        body: Container(),
      ),
    );
  }
}
