import 'package:bak/models/classes/product.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';
import 'package:bak/pages/profile/follow.dart';
import 'package:bak/pages/profile/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyCollectionPage extends StatelessWidget {
  User user;
  MyCollectionPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          infoLine(context),
          collectionItemList(context),
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

  Widget collectionItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('collections').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildCollectionList(context, snapshot.data.documents);
      },
    );
  }

  Widget buildCollectionList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collectionItems =
    snapshot.map((e) => Collection.fromSnapshot(e)).toList();

    return Container(
      height: 450,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: collectionItemBuilder(context, collectionItems),
      ),
    );
  }

  List<Widget> collectionItemBuilder(
      BuildContext context, List<Collection> collections) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < collections.length; i++)
      if(collections[i].userID == user.username)
        items.add(collectionItemFrame(
          context, collections[i]
        ));

    return items;
  }

  Widget collectionItemFrame(BuildContext context, Collection collection) {
    return Container(
      child: Column(
        children: [
          collectionForMyPage(context, collection, user),
          productOfCollectionItemList(context, collection)
        ],
      ),
    );
  }

  Widget productOfCollectionItemList(BuildContext context, Collection collection) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductOfCollectionList(context, snapshot.data.documents, collection);
      },
    );
  }

  Widget buildProductOfCollectionList(
      BuildContext context, List<DocumentSnapshot> snapshot, Collection collection) {
    List<Product> productOfCollectionItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        children: productOfCollectionItemBuilder(context, productOfCollectionItems, collection),
      ),
    );
  }

  List<Widget> productOfCollectionItemBuilder(
      BuildContext context, List<Product> products, Collection collection) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < products.length; i++)
      products[i].collections.forEach((e) {
        if(e == collection.userID+'+'+collection.title)
          items.add(productItemCardSmall(context, products[i], user));
      });

    return items;
  }
}
