import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/components/selection.dart';
import 'package:editsource/models/components/search.dart';
import 'package:editsource/pages/product/productList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                new Collection('title', new User('username', 5, '/'), '/')),
            collection(context),
          ],
        ),
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
          child: Text('인기 검색어'),
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
                  child: Text('NEW NEW PICK'),
                ),
                seeMore(context, offWhite, ProductList()),
              ],
            ),
            Expanded(child: sampleListView())
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
          child: Text('인기 셀러'),
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
                ),
              ),
              seeMore(context, accent1, ProductList()),
            ],
          ),
          Expanded(child:
          Container(
              margin: EdgeInsets.only(left: 10),
              child: sampleListView()),
          )
        ],
      ),
    );
  }

  Widget collection(BuildContext context) {
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
          ),
        ),
      ],
    );
  }

  Widget seeMore(BuildContext context, Color _color, Widget _nav) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 20),
          child: Text(
            '+ 더보기',
            style:
                TextStyle(decoration: TextDecoration.underline, color: _color),
          ),
        ),
      ),
    );
  }

  Widget sampleListView() {
    return ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, right: 5),
          child:
              productItemCardMedium(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 5),
          child:
              productItemCardMedium(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 5),
          child:
              productItemCardMedium(context, new Product('title', 100000, '/')),
        ),
      ],
    );
  }
}
