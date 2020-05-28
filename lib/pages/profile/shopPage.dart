import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              user.profilePicture,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '@' + user.username,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      ' * * * * * ',
                                      style: TextStyle(color: Colors.red, fontSize: 18),
                                    ),
                                    Text(
                                      ' (Reviews ' + '5' + ')',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(height: 10,),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '129',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text('상품', style: TextStyle(color: Colors.grey,fontSize: 12),),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '12K',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text('팔로워', style: TextStyle(color: Colors.grey,fontSize: 12),),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '9',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text('팔로잉', style: TextStyle(color: Colors.grey,fontSize: 12),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Material(
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
                          Container(
                            height: 20,
                          ),
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/pl');
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                color: Colors.grey[300],
                                child: Center(
                                  child: Icon(Icons.mail_outline)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("안녕하세요. 버즈 라이트이어입니다. \n hihi\n hihi\n hihi\n hihi", style: TextStyle(fontSize: 12),),
                )
              ],
            ),
            color: Colors.white,
          ),
          Column(
              //children: getPosts(),
              )
        ],
      ),
    );
  }
}
