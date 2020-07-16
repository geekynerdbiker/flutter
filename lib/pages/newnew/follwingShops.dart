import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/product/productList.dart';
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
        ],
      ),
    );
  }
  
  Widget followingShop(BuildContext context) {
    return Column(
      children: [
        shopInfo(context),
        productList(context),
      ],
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

  Widget productList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 280,
      child: ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
//          productItemCardMedium(context, new Product('title', 1, 'imageURI[0]'), primary),
//          wSpacer(4),
//          productItemCardMedium(context, new Product('title', 1, 'imageURI[0]'), primary),
//          wSpacer(4),
//          productItemCardMedium(context, new Product('title', 1, 'imageURI[0]'), primary),
//          wSpacer(4),
//          productItemCardMedium(context, new Product('title', 1, 'imageURI[0]'), primary),
        ],
      ),
    );
  }
}
