import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newnew/models/widgets/appbar.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/pages/home/builder.dart';

import 'package:newnew/pages/profile/popularSeller.dart';
import 'package:newnew/pages/forYou/userCollectionPage.dart';
import 'package:newnew/pages/product/productListPage.dart';

import 'package:newnew/widgets/home/popularSellers.dart';
import 'package:newnew/models/widgets/searchBar.dart';
import 'package:newnew/widgets/home/sideScrollViewerHorizontal.dart';
import 'package:newnew/widgets/home/squareList.dart';
import 'package:newnew/widgets/home/sideScrollViewerVertical.dart';
import 'package:newnew/widgets/home/trendingSearch.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool isSignIn = false;

  Firestore firestore = Firestore.instance;
  Stream<QuerySnapshot> streamData;

  void initState() {
    super.initState();
    streamData = firestore.collection('product').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('product').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> products =
        snapshot.map((d) => Product.fromSnapShot(d)).toList();
    return TestBuilder(products: products,);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: mainAppBar(context),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.width * 0.8,
              child: CarouselSlider(
                items: <Widget>[
                  Image.asset(
                    'lib/assets/c2.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'lib/assets/c1.png',
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  height: MediaQuery.of(context).size.width * 0.8,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    child: Text(
                      '인기 검색어',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TrendingSearch(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Text(
                    'NEW NEW PICK',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 5),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
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
            //_fetchData(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    'XXX님, 까먹지 마세요!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.width / 3 + 42,
              child: SquareList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    '인기 셀러',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PopularSellerPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 130,
              child: PopularSellers(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '#여행 ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '(해시태그 기획전)',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SideScrollViewerVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '#골동품 ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '(해시태그 기획전)',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SideScrollViewerVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '#북유럽 ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '(해시태그 기획전)',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SideScrollViewerVertical(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Text(
                    'Collection',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserCollectionPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SideScrollViewerHorizontal(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
                  child: Text(
                    '10만원 미만 ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12, right: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductListPage()));
                      },
                      child: Container(
                        width: 70,
                        height: 30,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SideScrollViewerVertical(),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30),
                  height: 300,
                  child: Image.asset(
                    'lib/assets/post02.jpg',
                    fit: BoxFit.none,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200, left: 60),
                  padding: EdgeInsets.only(left: 4),
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.orange,
                  ),
                  child: Text(
                    '쇼핑하기',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
