import 'package:flutter/material.dart';

Widget notificationAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: Container(),
    title: Text('Notification', style: TextStyle(color: Colors.black),
    ),
  );
}
