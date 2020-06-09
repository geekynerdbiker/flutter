import 'package:flutter/material.dart';
import 'package:newnew/pages/profile/myCollectionPage.dart';
import 'package:newnew/pages/profile/profilePage.dart';
import 'package:newnew/pages/profile/shopPage.dart';
import 'package:newnew/testInput.dart';
import 'package:newnew/widgets/category/squareList(2in1).dart';
import 'package:newnew/widgets/product/products.dart';
import 'package:newnew/widgets/profile/reviews.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.75,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            '내 정보',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star, size: 16, color: Colors.orange,
                                ),
                                Text(
                                  ' 4.8',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Padding(padding: EdgeInsets.only(top: 4), child: Text(
                                    ' (' + '17' + ')',
                                    style: TextStyle(fontSize: 10),)
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            color: Colors.white,
          ),
          TabBar(
            controller: _controller,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Text('my items' + ' ('+'42'+ ')'),
              ),
              Tab(
                icon: Text('my collections' + ' ('+'9'+')'),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: Row(
                        children: <Widget>[
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
                                Text(
                                  'follower',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
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
                                Text(
                                  'following',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 48,
                      child: Products(productItems),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: Row(
                        children: <Widget>[
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
                                Text(
                                  'follower',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
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
                                Text(
                                  'following',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 48,
                      child: MyCollectionPage(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
