import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget orderAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery
        .of(context)
        .size
        .height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        'Order Artwork',
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(CupertinoIcons.back, color: Colors.black,),
    ),
  );
}
