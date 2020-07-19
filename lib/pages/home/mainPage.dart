import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/models/components/search.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/product/productList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  User user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> carousel = [
    'gs://newnew-test.appspot.com/1-1.JPG',
    'gs://newnew-test.appspot.com/1-2.JPG',
    'gs://newnew-test.appspot.com/1-3.JPG',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    User user;

    return Scaffold(
      appBar: mainAppBar(context, user),
      backgroundColor: offWhite,
      body: ListView(
        children: <Widget>[
          carouselAndSearchBar(context),
          trendSearch(context),
          newNewPick(context),
          newNewPeople(context),
          recentView(context),
          hashTagCollection(context, new Collection('title', 'username', '/')),
          collectionBanner(context),
        ],
      ),
    );
  }

  Widget carouselAndSearchBar(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: carousel
              .map((item) => Container(
                    child: Image(
                      image: FirebaseImage(item,
                          shouldCache: true,
                          maxSizeBytes: 20 * 1024 * 1024,
                          cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.green,
                  ))
              .toList(),
          options: CarouselOptions(
              height: MediaQuery.of(context).size.width * (460 / 375),
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (460 / 375) - 45),
          child: Center(
            child: DotsIndicator(
                dotsCount: carousel.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                    shape: CircleBorder(
                        side: BorderSide(color: Color.fromRGBO(255, 52, 0, 1))),
                    color: Colors.transparent,
                    activeColor: Color.fromRGBO(254, 59, 0, 1))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
              child: Material(
            child: InkWell(
              child: searchBarDisable(context),
            ),
          )),
        ),
      ],
    );
  }

  Widget trendSearch(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * (231 / 375),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              '인기 검색어',
              style: subTitle1(accent1),
            ),
          ),
          Container(
              child: Column(
            children: [
              Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Keyword',
                            style: popularSearchEngSmall(primary),
                          ),
                          Text(
                            'Keyword',
                            style: popularSearchEngLarge(primary),
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 100),
                        ),
                        Text(
                          '빈티지 가구',
                          style: popularSearchKRLarge(primary),
                        ),
                        Text(
                          'acne JEAN',
                          style: popularSearchEngSmall(primary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                    ),
                    Text(
                      'nike',
                      style: popularSearchEngSmall(primary),
                    ),
                    Text(
                      'JORDAN',
                      style: popularSearchEngLarge(primary),
                    ),
                    Text(
                      '슈프림',
                      style: popularSearchKRLarge(primary),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget newNewPick(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * (336 / 375),
        color: accent1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    'NEW NEW PICK',
                    style: subTitle2(offWhite),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, right: 20),
                  child: seeMore(context, offWhite, ProductListPage()),
                ),
              ],
            ),
            productItemList(context, offWhite),
          ],
        ));
  }

  Widget newNewPeople(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 20),
          child: Text(
            '뉴뉴 피플',
            style: subTitle1(primary),
          ),
        ),
        getPeople(context),
      ],
    );
  }

  Widget getPeople(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildUserMarquee(context, snapshot.data.documents);
      },
    );
  }

  Widget buildUserMarquee(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<User> userItems = snapshot.map((e) => User.fromSnapshot(e)).toList();
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 50, left: 20),
            child: userMarqueePopularSeller(context, userItems[index]),
          );
        },
      ),
    );
  }

  Widget recentView(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * (336 / 375),
        color: accent2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    '최근 본 상품',
                    style: subTitle2(primary),
                  ),
                ),
              ],
            ),
            productItemList(context, primary),
          ],
        ));
  }

  Widget hashTagCollection(BuildContext context, Collection collection) {
    return Container(
      height: MediaQuery.of(context).size.width * (365 / 375),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  '#' + collection.title,
                  style: title2(primary),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, right: 20),
                child: seeMore(context, primary, ProductListPage()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget collectionBanner(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
          child: Text(
            '컬렉션',
            style: subTitle1(primary),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width * (800 / 375),
          color: accent3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          Text(
                            ' MAKE YOUR',
                            style: collectionTitle(offWhite),
                          ),
                          Text(
                            'COLLECTION',
                            style: collectionTitle(offWhite),
                          ),
                        ],
                      )
                    ],
                  )),
              collectionItemList(context),
              collectionItemList2(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget productItemList(BuildContext context, Color color) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents, color);
      },
    );
  }

  Widget buildProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot, Color color) {
    List<Product> productItems =
        snapshot.map((e) => Product.fromSnapshot(e)).toList();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            child: productItemCardMedium(
                context, productItems[index], widget.user, color),
          );
        },
      ),
    );
  }

  Widget collectionItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('collections').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildCollectionBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildCollectionBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collectionItems =
        snapshot.map((e) => Collection.fromSnapshot(e)).toList();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: collectionItems.length,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: collectionCardSmall(
                      context, collectionItems[0], widget.user, offWhite),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: collectionCardLarge(
                      context, collectionItems[1], widget.user, offWhite),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget collectionItemList2(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('collections').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildCollectionBody2(context, snapshot.data.documents);
      },
    );
  }

  Widget buildCollectionBody2(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collectionItems =
        snapshot.map((e) => Collection.fromSnapshot(e)).toList();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: collectionItems.length,
        itemBuilder: (context, index) {
          return Container(
            height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: collectionCardLarge(
                      context, collectionItems[3], widget.user, offWhite),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: collectionCardSmall(
                      context, collectionItems[2], widget.user, offWhite),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
