import 'package:flutter/material.dart';

Widget notificationAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: Container(),
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset('logo-image-path'),
    ),
  );
}
