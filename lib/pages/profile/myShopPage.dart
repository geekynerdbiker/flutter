import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:flutter/material.dart';

class MyShopPage extends StatelessWidget {
  final User user;

  MyShopPage({this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      //shrinkWrap: true,
      children: [
        infoLine(context, user),
        GridView.count(crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          productItemCardLarge(context, new Product('title', 10000000, '/')),
          productItemCardLarge(context, new Product('title', 10000000, '/')),
          productItemCardLarge(context, new Product('title', 10000000, '/')),
          productItemCardLarge(context, new Product('title', 10000000, '/')),

        ],)
      ],
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
        ),
      ],
    );
  }
}
