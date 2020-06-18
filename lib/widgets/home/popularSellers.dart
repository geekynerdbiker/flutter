import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnew/models/classes/user.dart';
import 'package:newnew/testInput.dart';

class PopularSellers extends StatelessWidget {

  List<Widget> getUsers(BuildContext context) {
    List<Widget> users = [];
    int index = 0;
    for (User user in userList) {
      users.add(getUser(context, user, index));
      index ++;
    }
    return users;
  }

  Widget getUser(BuildContext context, User user, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
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
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children:
        getUsers(context),
      ),
    );
  }
}