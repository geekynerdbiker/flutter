import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget orderAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        'ORDER ARTWORK',
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(CupertinoIcons.back),
    ),
  );
}
