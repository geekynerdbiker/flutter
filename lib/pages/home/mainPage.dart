
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/models/components/search.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/product/productList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      backgroundColor: offWhite,
      body: ListView(
        children: <Widget>[
          carouselAndSearchBar(context),
          trendSearch(context),
          newNewPick(context),
          popularSeller(context),
          recentView(context),
          hashTagCollection(context,
              new Collection('title', new User('username', '1', '/'), '/')),
          collectionBanner(context),
        ],
      ),
    );
  }

  Widget carouselAndSearchBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (375 / 375),
          height: MediaQuery.of(context).size.width * (460 / 375),
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (460 / 375) - 45),
          child: Center(
            child: imageCarouselIndicator(0, 5),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: SearchField(),
          ),
        ),
      ],
    );
  }

  Widget trendSearch(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * (201 / 375),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20),
          child: Text(
            '인기 검색어',
            style: subTitle1(accent1),
          ),
        ),
      ],
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
                  child: seeMore(context, offWhite, ProductListPage(collectionName: 'newnewpick',)),
                ),
              ],
            ),
            itemList(context, 'newnewpick')
          ],
        ));
  }

  Widget popularSeller(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * (211 / 375),
          color: offWhite,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20),
          child: Text(
            '인기 셀러',
            style: subTitle1(primary),
          ),
        ),
      ],
    );
  }

  Widget recentView(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * (251 / 375),
          color: accent2,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20),
          child: Text(
            '최근 본 상품',
            style: subTitle2(primary),
          ),
        ),
      ],
    );
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
          itemList(context, 'hashtag1'),
        ],
      ),
    );
  }

  Widget collectionBanner(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          height: MediaQuery.of(context).size.width * (772 / 375),
          color: accent3,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
          child: Text(
            '컬렉션',
            style: subTitle1(primary),
          ),
        ),
      ],
    );
  }

  Widget itemList(BuildContext context, String collectionName) {
    int length = 0;
    return FutureBuilder(
        future: getProducts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading..'),
            );
          } else {
            return Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      DocumentSnapshot product = snapshot.data[index];
                      for (int i = 0;
                          i < product.data['collections'].length;
                          i++) {
                        if (product.data['collections'][index] !=
                            collectionName)
                          return Container();
                        else
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: productItemCardMedium(context, product),
                          );
                      }
                    }));
          }
        });
  }

  Future getProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn.documents;
  }
}
