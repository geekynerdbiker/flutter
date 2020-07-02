import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/pages/collection/collectionDetailPage.dart';
import 'package:editsource/pages/product/productList.dart';
import 'package:flutter/material.dart';

class FollowingCollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          collectionItem(context, new Collection('title', new User('username', 1, 'imageURI'), 'imageURI')),
          collectionItem(context, new Collection('title', new User('username', 1, 'imageURI'), 'imageURI')),
          collectionItem(context, new Collection('title', new User('username', 1, 'imageURI'), 'imageURI')),
        ],
      ),
    );
  }

  Widget collectionItem(BuildContext context, Collection collection) {
    return Container(
      height: MediaQuery.of(context).size.width * (500 / 375),
      child: Column(
        children: [
          collectionBannerItem(context, collection),
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
            Text('@' + collection.userID.username),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollectionDetailPage(collection)));
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

  Widget collectionBannerItem(BuildContext context, Collection collection) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.width * (260 / 375);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: collectionInfoLine(context, collection),
          ),
          collectionImageBox(context, collection, _width, _height),
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
          child:
          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 8),
          child:
          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, right: 8),
          child:
          productItemCardSmall(context, new Product('title', 100000, '/')),
        ),
      ],
    );
  }
}
