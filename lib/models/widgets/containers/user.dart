import 'package:flutter/material.dart';
import 'package:newnew/models/classes/user.dart';

Container userCircle(BuildContext context, User user) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black,
          ),
          child: Center(
            child: Text(user.username, style: TextStyle(color: Colors.yellow)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(user.username, style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );
}