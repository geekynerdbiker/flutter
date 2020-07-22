import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/profile/follow.dart';
import 'package:bak/pages/profile/review.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyShopPage extends StatelessWidget {
  User user;

  MyShopPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        infoLine(context),
        productItemList(context),
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
                        Text(user.following.length.toString()),
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
                  ImageIcon(
                    AssetImage(star_idle),
                    size: 12,
                  ),
                  wSpacer(_space2),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewPage(user: user)));
                      },
                      child: Text('(' + user.reviews.length.toString() + ')'),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductList(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
        snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      height: 450,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 10,
        physics: ClampingScrollPhysics(),
        children: productItemBuilder(context, productItems),
      ),
    );
  }

  List<Widget> productItemBuilder(
      BuildContext context, List<Product> products) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < products.length; i++)
      if(products[i].userID == user.username)
      items.add(ProductItemCardLarge(
        product: products[i],
        user: user,
      ));

    return items;
  }
}
