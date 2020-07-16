import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/pages/profile/follow.dart';
import 'package:bak/pages/profile/review.dart';
import 'package:flutter/material.dart';

class MyShopPage extends StatelessWidget {
  User user;

  MyShopPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          infoLine(context, user),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FollowerPage()));
                  },
                  child: Row(
                    children: [
                      Text('팔로워'),
                      wSpacer(_space1),
                      //Text(user.followers.length.toString()),
                    ],
                  ),
                ),
              ),
              wSpacer(_space2),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FollowingPage()));
                  },
                  child: Row(
                    children: [
                      Text('팔로잉'),
                      wSpacer(_space1),
                      //Text(user.following.length.toString()),
                    ],
                  ),
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
              //Text(user.lastActivity),
              wSpacer(_space2),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReviewPage()));
                  },
                  child: Text(
                      '(' + user.reviews.length.toString() + ' Reviews' + ')'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
