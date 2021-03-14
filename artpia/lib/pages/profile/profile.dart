import 'package:flutter/material.dart';

import 'package:artpia/pages/profile/module.dart';

class ProfilePage extends StatefulWidget {
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
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            userProfile(context),
            productList(context),
          ],
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, right: 20),
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: width * 0.1,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: width * 0.16,
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
                    width: width * 0.16,
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
                    width: width * 0.16,
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
                    width: width * 0.25,
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
                    width: width * 0.25,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        'Notification',
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
    final double height = MediaQuery.of(context).size.height;

    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        physics: NeverScrollableScrollPhysics(),
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
