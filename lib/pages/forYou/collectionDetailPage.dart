import 'package:flutter/material.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/pages/product/productListPage.dart';
import 'package:newnew/widgets/home/sideScrollViewerVertical.dart';
import 'package:newnew/widgets/forYou/collection/products.dart';
import 'package:newnew/widgets/forYou/collection/products2.dart';

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
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '컬렉션',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(color: Colors.black),
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
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
                                  widget.collection.owner.username.length
                                          .toDouble() *
                                      10,
                              child: Text(
                                'by ' + widget.collection.owner.username,
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
                                widget.collection.owner.profilePicture,
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
                                widget.collection.owner.myProducts.length
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
                                widget.collection.owner.followers.length
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
                        Icons.view_headline,
                        size: 16,
                      ),
                    ),
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
            height: 200 + MediaQuery.of(context).size.width * 5 / 8,
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                Products(widget.collection.productList),
                Products(widget.collection.productList),
                Products2(widget.collection.productList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
