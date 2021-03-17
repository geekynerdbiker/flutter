import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget settingAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      'Setting',
      style: TextStyle(color: Colors.black),
    ),
    leading: FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(CupertinoIcons.clear, size: 18, color: Colors.grey,),
    ),
  );
}
