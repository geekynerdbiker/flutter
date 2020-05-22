import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  TabController _controller;

  List<Widget> pages = [

  ];

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
        body: Column(children: <Widget>[
          Container(
            child: AppBar(
              elevation: 0.75,
              backgroundColor: Colors.white,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black,),
                          onPressed: () {
                            setState(() {
                            });
                          },
                        ),
                        Text('프로필', style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height- 168),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: CircleAvatar(backgroundImage: user.profilePicture,),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('상품')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Text('129K', style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('팔로워')
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Text('129', style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text('팔로잉')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      color: Colors.grey[200],
                                    ),
                                    margin: EdgeInsets.all(10),
                                    width: 120,
                                    height: 30,
                                    child: FlatButton(
                                      child: Text('연락하기',style: TextStyle(color: Colors.black),),
                                      onPressed: () {

                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7))
                                    ),
                                    child: FlatButton(
                                      child: Text('프로필 수정'),
                                      onPressed: () {

                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(user.username, style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("안녕하세요. 버즈 라이트이어입니다."),
                              InkWell(
                                child: new Text('좋은 물건 보고가세요!'),
                                //onTap: () => launch('https://www.instagram.com/kallehallden/')
                                ),
                            ],
                          ),
                          Container(

                          )
                        ],
                      )
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
                        icon: Text('상품'),
                      ),
                      Tab(
                        icon: Text('컬렉션'),
                      ),
                    ],
                  ),
//                TabBarView(
//                  children: pages,
//                ),
                Column(
                  children: getPosts(),
                )
              ],
            ),
          )
        ],
      )
    );
  }


  List<Widget> getPosts() {
    List<Widget> postRows = [];
  List<Widget> posts = [];
  int counter = 0;
  for (Post post in userPosts) {
    double marginLeft = 2;
    if (counter == 3) {
      marginLeft = 0;
    } else if (counter == 0) {
      marginLeft = 0;
    }
    posts.add(getPost(post, marginLeft));
        if (counter == 2) {
      postRows.add(Container(
        child: Row(
          children: posts,
        ),
      ));
      posts = [];
      counter = 0;
    } else {
      counter++;
    }
  }
  if (posts.length > 0) {
      postRows.add(Container(
        child: Row(
          children: posts,
        ),
      ));
  }
  return postRows;
}

Widget getPost(Post post, double margin) {
  return Container(
          margin: EdgeInsets.only(left: margin, bottom: 2),
              height: 125,
              width: 123.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: post.image,
                  fit: BoxFit.fill
                )
              ),
            );
}

}