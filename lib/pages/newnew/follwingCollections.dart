import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';
import 'package:bak/pages/product/productList.dart';
import 'package:flutter/material.dart';

class FollowingCollectionsPage extends StatelessWidget {
  final User user;

  FollowingCollectionsPage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
        ],
      ),
    );
  }

  Widget collectionItem(BuildContext context, Collection collection, User user) {
    return Container(
      height: MediaQuery.of(context).size.width * (500 / 375),
      child: Column(
        children: [
          collectionBannerItem(context, collection, user),
          Expanded(child:collectionProductItemList(context, collection)),
        ],
      ),
    );
  }

  Widget collectionInfoLine(BuildContext context, Collection collection) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(collection.title + '(Item #)'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('@' + collection.userID),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollectionDetailPage(collection: collection, user: user,)));
                },
                child: Text(
                  '+ 더보기',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget collectionBannerItem(BuildContext context, Collection collection, User user) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.width * (260 / 375);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: collectionInfoLine(context, collection),
          ),
          collectionImageBox(context, collection, _width, _height, user),
        ],
      ),
    );
  }

  Widget collectionProductItemList(
      BuildContext context, Collection collection) {
    return ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, right: 8),
//          child:
//          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 8),
//          child:
//          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 8),
//          child:
//          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
      ],
    );
  }
}
