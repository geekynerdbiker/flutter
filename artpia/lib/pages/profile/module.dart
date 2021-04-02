import 'package:artpia/pages/setting/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/assets/module.dart';

Widget profileAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery
        .of(context)
        .size
        .height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: Container(),
    title: Text('Profile', style: TextStyle(color: Colors.black),),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.push(context, _createRoute());
          },
          color: Colors.transparent,
          child: Icon(CupertinoIcons.settings, size: 24,)
      ),
    ],
  );
}

Widget userProfile(BuildContext context, UserClass user) {
  return Column(
    children: [
      Row(
        children: [
          profileImage(context, user),
        ],
      ),
      Text(user.bio),
    ],
  );
}

Widget artworkList(BuildContext context, UserClass user) {
  return GridView.builder(
    gridDelegate: null,
    itemBuilder: null,
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SettingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}