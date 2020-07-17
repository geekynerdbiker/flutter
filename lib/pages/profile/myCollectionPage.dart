import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';
import 'package:bak/pages/profile/follow.dart';
import 'package:bak/pages/profile/review.dart';
import 'package:flutter/material.dart';

class MyCollectionPage extends StatelessWidget {
  User user;
  MyCollectionPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          infoLine(context),
        ],
    );
  }

  Widget infoLine(BuildContext context) {
    const double _space1 = 4;
    const double _space2 = 8;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, bottom: 10),
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
                        user.followers == null
                            ? Container()
                            : Text(user.followers.length.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  ImageIcon(AssetImage(star_idle), size: 12,),
                  wSpacer(_space2),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewPage(user: user)));
                      },
                      child: Text('(' +
                          user.reviews.length.toString() +
                          ')'),
                    ),
                  )
                ],
              )),
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
            Text('@' + collection.userID),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollectionDetailPage(collection: collection)));
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
