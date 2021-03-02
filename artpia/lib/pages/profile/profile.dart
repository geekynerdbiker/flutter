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
        child: Column(
          children: <Widget>[
            userProfile(context),
            productList(context),
          ],
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.3,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top:30, right: 20),
            alignment: Alignment.topCenter,
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
                          '1000',
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
                          '1000',
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

  Widget productList(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.49,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          testItem(),
          testItem2(),
          testItem3(),
          testItem2(),
          testItem(),
          testItem2(),
          testItem3(),
          testItem2(),
          testItem(),
          testItem2(),
          testItem3(),
          testItem2(),
          testItem(),
        ],
      ),
    );
  }

  Widget testItem() {
    return Container(
      color: Colors.orange,
    );
  }
  Widget testItem2() {
    return Container(
      color: Colors.blueGrey,
    );
  }
  Widget testItem3() {
    return Container(
      color: Colors.cyan,
    );
  }
}
