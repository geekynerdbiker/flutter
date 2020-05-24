import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/widgets/etc/sideScrollViewerVertical.dart';

class PopularSeller extends StatelessWidget {
  List<Widget> getUsers(BuildContext context) {
    List<Widget> users = [];
    int index = 0;

    for (User user in userList) {
      if (user.myProducts.length != 0) users.add(getUser(context, user, index));
      index++;
    }
    return users;
  }

  Widget getUser(BuildContext context, User user, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 40,
                          width: 40,
                          child: CircleAvatar(),
                        ),
                        Container(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              child: Text(
                                user.username,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text(
                                '*****' +
                                    ' (' +
                                    user.myProducts.length.toString() +
                                    ')',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, right: 5),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/pl');
                          },
                          child: Container(
                            width: 70,
                            height: 30,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 1 / 3 + 34,
            width: MediaQuery.of(context).size.width - 20,
            child: SideScrollViewerVertical(index),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: getUsers(context),
      ),
    );
  }
}
