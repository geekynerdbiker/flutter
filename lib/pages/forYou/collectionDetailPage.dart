import 'package:flutter/material.dart';
import 'package:newnew/models/classes/collection.dart';

import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/widgets/forYou/comments.dart';
import 'package:newnew/widgets/product/products.dart';
import 'package:newnew/widgets/product/products3.dart';

class CollectionDetailPage extends StatefulWidget {
  final Collection collection;

  const CollectionDetailPage(this.collection);

  @override
  _CollectionDetailPageState createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage>
    with SingleTickerProviderStateMixin {
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
      appBar: appBarDefaultDeep(context, '컬렉션 상세'),
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 2 / 5,
        child: FloatingActionButton.extended(
            label: Text(
              "이 기획전 참여하기",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            backgroundColor: Colors.black,
            onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 5 / 8,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Image.asset(
                    widget.collection.imageURI,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 20,
                          width: widget.collection.title.length.toDouble() * 10,
                          child: Text(
                            widget.collection.title + ' ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 20,
                              width: 20 +
                                  widget.collection.userID.username.length
                                          .toDouble() *
                                      10,
                              child: Text(
                                'by ' + widget.collection.userID.username,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            Container(
                              width: 3,
                            ),
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                              ),
                              child: Image.asset(
                                widget.collection.userID.imageURI,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.collection.userID.myProducts.length
                                    .toString(),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Items',
                                textAlign: TextAlign.start,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.collection.userID.followers.length
                                    .toString(),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Followers',
                                textAlign: TextAlign.start,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Text(widget.collection.subscription),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 30,
                width: 90,
                child: TabBar(
                  controller: _controller,
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.border_all,
                        size: 16,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.apps,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 200 + MediaQuery.of(context).size.width * 1 / 2,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Products(widget.collection.products),
                Products3(widget.collection.products),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              height: 40,
              child: Text(
                '유저들의 ' + widget.collection.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            height: 200 + MediaQuery.of(context).size.width * 1 / 2,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Products(widget.collection.products),
                Products3(widget.collection.products),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              height: 40,
              child: Text(
                '댓글',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          CommentList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 120,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 3),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: '댓글을 입력하세요.'),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                  height: 40,
                  width: 40,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '작성',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
