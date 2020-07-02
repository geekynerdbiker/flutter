import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/collection.dart';

import 'package:editsource/pages/product/productDetailPage.dart';
import 'package:editsource/pages/collection/collectionDetailPage.dart';

Widget productItemCardLarge(BuildContext context, Product product) {
  const double _width = 185;
  const double _height = 250;
  const double _space1 = 14;
  const double _space2 = 4;
  const double _icon = 44;

  bool isMyProduct = false;

  return Container(
    width: _width,
    child: Column(
      children: <Widget>[
        productImageBox(context, product, _width, _height),
        hSpacer(_space1),
        Container(
          padding: EdgeInsets.only(left: 12),
          child: SizedBox(
            width: _width - 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title),
                    hSpacer(_space2),
                    Text(product.price.toString()),
                  ],
                ),
                Container(
                  width: _icon,
                  height: _icon,
                  child: Center(
                    child: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget productItemCardMedium(BuildContext context, Product product) {
  const double _width = 160;
  const double _height = 200;
  const double _space1 = 14;
  const double _space2 = 4;
  const double _icon = 44;

  bool isMyProduct = false;

  return Container(
    child: Column(
      children: <Widget>[
        productImageBox(context, product, _width, _height),
        hSpacer(_space1),
        Container(
          padding: EdgeInsets.only(left: 12),
          child: SizedBox(
            width: _width - 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title),
                    hSpacer(_space2),
                    Text(product.price.toString()),
                  ],
                ),
                Container(
                  width: _icon,
                  height: _icon,
                  child: Center(
                    child: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget productItemCardSmall(BuildContext context, Product product) {
  const double _width = 120;
  const double _height = 120;
  const double _space1 = 8;
  const double _space2 = 4;

  bool isMyProduct = false;

  return Container(
    child: Column(
      children: <Widget>[
        productImageBox(context, product, _width, _height),
        hSpacer(_space1),
        Container(
            padding: EdgeInsets.only(left: 12),
            child: SizedBox(
              width: _width - 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title),
                  hSpacer(_space2),
                  Text(product.price.toString()),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget collectionCoverCard(BuildContext context, Collection collection) {
  const double _width = 375;
  const double _height = 280;
  const double _space1 = 16;
  const double _space2 = 20;
  const double _space3 = 7;
  const double _space4 = 4;

  bool isMyCollection = false;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        collectionImageBox(context, collection, _width, _height),
        hSpacer(_space1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(collection.title),
                hSpacer(_space3),
                Row(
                  children: [
                    Text('아이템'),
                    wSpacer(_space3),
                    Text(collection.products.length.toString()),
                    wSpacer(_space4),
                    Text('팔로워'),
                    wSpacer(_space3),
                    Text(collection.getFollowers().toString()),
                  ],
                ),
              ],
            ),
            action2Idle(context, '+ Follow'),
          ],
        ),
        hSpacer(_space2),
        Text('@' + collection.userID.username),
        hSpacer(_space3),
        Text(collection.subscription),
      ],
    ),
  );
}

Widget productImageBox(
    BuildContext context, Product _product, double _width, double _height) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(_product)));
      },
      child: Container(
        width: _width,
        height: _height,
        color: Colors.grey,
        child: Image.asset(
          _product.imageURItest,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget collectionImageBox(BuildContext context, Collection collection,
    double _width, double _height) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CollectionDetailPage(collection)));
      },
      child: Container(
        width: _width,
        height: _height,
        color: Colors.grey,
        child: Image.asset(
          collection.imageURI,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget keywordNotificationListItem() {
  const double _size = 52;
  const double _space1 = 8;
  const double _space2 = 4;

  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 20),
    child: Row(
      children: <Widget>[
        Container(
          width: _size,
          height: _size,
          color: Colors.grey,
        ),
        wSpacer(_space1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('[' + 'keyword' + ']'),
                wSpacer(_space2),
                Text('Notification Message'),
              ],
            ),
            hSpacer(_space2),
            Text('Time'),
          ],
        ),
      ],
    ),
  );
}

Widget collectionShowcase(BuildContext context, Collection collection) {
  const double _width = 240;
  const double _height = 160;
  const double _space1 = 8;
  const double _space2 = 6;

  bool isMyCollection = false;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        collectionImageBox(context, collection, _width, _height),
        hSpacer(_space1),
        Container(
          width: _width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(collection.title),
                    hSpacer(_space2),
                    Text('@' + collection.userID.username),
                  ],
                ),
              ),
              action2Idle(context, '+ 팔로우'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget productItem1(BuildContext context, Product _product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          productImageBox(context, _product, 48, 48),
          wSpacer(12),
          Column(children: [
            Text(_product.title),
            Text(_product.price.toString()),
          ],),
          Column(children: [
            Text(_product.getStaus()),
            shortButton(context, offWhite, true, Text('리뷰 쓰기')),
          ],),
        ],
      ),
      Row(
        children: [
          profileImage(_product.userID, 16),
          wSpacer(4),
          Text(_product.userID.username),
        ],
      )
    ],
  );
}
