import 'package:editsource/models/classes/user.dart';
import 'package:flutter/material.dart';



Widget profileImage(User user, double _r) {
  return Container(
    width: _r,
    height: _r,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.grey),
    child: Center(
        child: Image.asset(
          user.imageURI,
          fit: BoxFit.cover,
        )),
  );
}

Widget wSpacer(double _space) {
  return Container(width: _space,);
}

Widget hSpacer(double _space) {
  return Container(height: _space,);
}