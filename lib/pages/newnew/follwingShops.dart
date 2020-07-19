import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/product/productList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FollowingShopsPage extends StatelessWidget {
  User user;
  FollowingShopsPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          followingShop(context),
          followingShop(context),
        ],
      ),
    );
  }

  Widget followingShop(BuildContext context) {
    return Container(
        child: Column(
          children: [
            shopInfo(context),
            Container(
              height: 290,
              child: productItemList(context),
            ),
          ],
        ),
    );
  }

  Widget shopInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          userMarquee1(context, user),
          seeMore(context, accent1, ProductListPage()),
        ],
      )
    );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            child: productItemCardMedium(
                context, productItems[index], user, primary),
          );
        },
    );
  }
}
