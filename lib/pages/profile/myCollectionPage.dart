import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';
import 'package:bak/pages/profile/follow.dart';
import 'package:flutter/material.dart';

class MyCollectionPage extends StatelessWidget {
  final User user;

  MyCollectionPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          infoLine(context, user),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: collectionItem(context,
                new Collection('title', new User('username', '1', '/'), '/')),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: collectionItem(context,
                new Collection('title', new User('username', '1', '/'), '/')),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: collectionItem(context,
                new Collection('title', new User('username', '1', '/'), '/')),
          ),
        ],
      ),
    );
  }

  Widget infoLine(BuildContext context, User user) {
    const double _space1 = 4;
    const double _space2 = 8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Material(
                child: InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FollowerPage()));},
                  child: Row(children: [
                    Text('팔로워'),
                    wSpacer(_space1),
                    Text(user.getFollowers().toString()),
                  ],),
                ),
              ),
              wSpacer(_space2),
              Material(
                child: InkWell(
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingPage()));},
                  child: Row(children: [
                    Text('팔로잉'),
                    wSpacer(_space1),
                    Text(user.getFollowing().toString()),
                  ],),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star_border),
              wSpacer(_space1),
              Text(user.getRate().toString()),
              wSpacer(_space2),
              Text('(' + user.getReviews().toString() + ' Reviews' + ')'),
            ],
          ),
        )
      ],
    );
  }

  Widget collectionItem(BuildContext context, Collection collection) {
    return Container(
        height: MediaQuery.of(context).size.width * (500 / 375),
      child: Column(
        children: [
          collectionBannerItem(context, collection),
          Expanded(child: collectionProductItemList(context, collection)),
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
//            child:
//            productItemCardSmall(context, new Product('title', 100000, '/')),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
//            child:
//            productItemCardSmall(context, new Product('title', 100000, '/')),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
//            child:
//            productItemCardSmall(context, new Product('title', 100000, '/')),
          ),
        ],
      );
    }
}
