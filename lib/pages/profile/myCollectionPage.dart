import 'package:editsource/models/UI/cards.dart';
import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/widgets/border.dart';
import 'package:flutter/material.dart';

class MyCollectionPage extends StatelessWidget {
  final User user;

  MyCollectionPage({this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        infoLine(user),
Expanded(child: collectionProductItemList(context, new Collection('title', new User('username', 1, '/'), '/')))
//        collectionItem(context,
//            new Collection('title', new User('username', 1, '/'), '/')),
      ],
    );
  }

  Widget infoLine(User user) {
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
              Text('팔로워'),
              wSpacer(_space1),
              Text(user.getFollowers().toString()),
              wSpacer(_space2),
              Text('팔로잉'),
              wSpacer(_space1),
              Text(user.getFollowing().toString()),
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
    return Column(
      children: [
        collectionInfoLine(context, collection),
        collectionBannerItem(context, collection),
        Expanded(child: collectionProductItemList(context, collection)),
      ],
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
            Text(
              '+ 더보기',
              style: TextStyle(decoration: TextDecoration.underline),
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
            margin: EdgeInsets.all(20),
            child: collectionInfoLine(context, collection),
          ),
          collectionImageBox(context, collection, _width, _height),
          hSpacer(8),
        ],
      ),
    );
  }

  Widget collectionProductItemList(BuildContext context, Collection collection) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Container(color: Colors.black,),
        Container(color: Colors.black,),
        Container(color: Colors.black,),
        Container(color: Colors.black,),
        Container(color: Colors.black,),
      ],
    );
  }
}
