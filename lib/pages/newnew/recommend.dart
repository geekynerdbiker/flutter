import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/pages/product/productList.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: collections(context),
          ),
          sellers(context),
          products(context),
        ],
      ),
    );
  }

  Widget collections(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('컬렉션'),
              seeMore(context, accent1, ProductListPage()),
            ],
          ),
        ),
        collectionList(context)
      ],
    );
  }

  Widget collectionList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          collectionShowcase(
              context,
              new Collection(
                  'title', new User('username', 1, 'imageURI'), 'imageURI')),
          wSpacer(4),
          collectionShowcase(
              context,
              new Collection(
                  'title', new User('username', 1, 'imageURI'), 'imageURI')),
          wSpacer(4),
          collectionShowcase(
              context,
              new Collection(
                  'title', new User('username', 1, 'imageURI'), 'imageURI')),
          wSpacer(4),
          collectionShowcase(
              context,
              new Collection(
                  'title', new User('username', 1, 'imageURI'), 'imageURI')),
          wSpacer(4),
          collectionShowcase(
              context,
              new Collection(
                  'title', new User('username', 1, 'imageURI'), 'imageURI')),
        ],
      ),
    );
  }

  Widget sellers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('추천 셀러'),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: userList(context),
        ),
      ],
    );
  }

  Widget userList(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
          userMarqueePopularSeller(
              context, new User('username', 1, 'imageURI')),
        ],
      ),
    );
  }

  Widget products(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('추천 상품'),
              seeMore(context, accent1, ProductListPage()),
            ],
          ),
        ),
        productList(context)
      ],
    );
  }

  Widget productList(BuildContext context) {
    double _size = MediaQuery.of(context).size.width / 3 - 4;

    return Container(
      height: _size * 4,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: [
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
          productImageBox(
              context, new Product('title', 1, 'imageURItest'), _size, _size),
        ],
      ),
    );
  }
}
