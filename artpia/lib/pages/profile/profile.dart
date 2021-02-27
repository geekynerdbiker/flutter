import 'package:flutter/material.dart';

import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/profile/modules.dart';

class ProfilePage extends StatefulWidget {
  // UserClass user;

  // ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: profileAppBar(context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            userProfile(context),
            // productList(context),
          ],
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: _width * 0.1,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: _width * 0.16,
                    child: Column(
                      children: [
                        Text('items'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    width: _width * 0.16,
                    child: Column(
                      children: [
                        Text('followers'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: _width * 0.16,
                    child: Column(
                      children: [
                        Text(
                          'following',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '0',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _width * 0.25,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        'Follow',
                      ),
                    ),
                  ),
                  Container(
                    width: _width * 0.25,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        'Messege',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
