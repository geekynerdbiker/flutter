import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/collection.dart';

import 'package:bak/pages/product/productDetailPage.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';

Widget productItemCardLarge(BuildContext context, Product product, User user) {
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
        productImageBox(context, product, _width, _height, user),
        hSpacer(_space1),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: _width - 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.length < 10
                          ? product.title
                          : product.title.substring(0, 10) + '..',
                      style: body1(primary),
                    ),
                    hSpacer(_space2),
                    Text(
                      product.price.toString() + '원',
                      style: body1(primary),
                    ),
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

Widget productItemCardMedium(
    BuildContext context, Product product, User user, Color _color) {
  const double _width = 160;
  const double _height = 200;
  const double _space1 = 14;
  const double _space2 = 4;
  const double _icon = 44;

  return Container(
    child: Column(
      children: <Widget>[
        productImageBox(context, product, _width, _height, user),
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
                    Text(
                      product.title.length < 9
                          ? product.title
                          : product.title.substring(0, 8) + ' ..',
                      style: body1(_color),
                    ),
                    hSpacer(_space2),
                    Text(
                      product.price.toString() + '원',
                      style: body1(_color),
                    ),
                  ],
                ),
                Container(
                  width: _icon,
                  height: _icon,
                  child: Center(
                    child: ImageIcon(
                      AssetImage(favorite_idle_inverse),
                      color: _color,
                    ),
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

Widget productItemCardSmall(BuildContext context, Product product, User user) {
  const double _width = 120;
  const double _height = 120;
  const double _space1 = 8;
  const double _space2 = 4;

  bool isMyProduct = false;

  return Container(
    child: Column(
      children: <Widget>[
        productImageBox(context, product, _width, _height, user),
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

Widget collectionCoverCard(
    BuildContext context, Collection collection, User user) {
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
        collectionImageBox(context, collection, _width, _height, user),
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
        Text('@' + collection.userID),
        hSpacer(_space3),
        Text(collection.description),
      ],
    ),
  );
}

Widget collectionCardSmall(
    BuildContext context, Collection collection, User user, Color _color) {
  const double _width = 180;
  const double _height = 184;
  const double _space1 = 12;
  const double _space2 = 6;

  return Container(
    height: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        collectionImageBox(context, collection, _width, _height, user),
        hSpacer(_space1),
        Text(
          collection.title + '(#' + collection.products.length.toString() + ')',
          style: body1(_color),
        ),
        hSpacer(_space2),
        Text(
          '@' + collection.userID,
          style: body1(_color),
        ),
      ],
    ),
  );
}

Widget collectionCardLarge(
    BuildContext context, Collection collection, User user, Color _color) {
  const double _width = 264;
  const double _height = 236;
  const double _space1 = 12;
  const double _space2 = 6;

  bool isMyCollection = false;

  return Container(
    height: 302,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        collectionImageBox(context, collection, _width, _height, user),
        hSpacer(_space1),
        Text(
          collection.title +
              ' (#' +
              collection.products.length.toString() +
              ')',
          style: body1(_color),
        ),
        hSpacer(_space2),
        Text(
          '@' + collection.userID,
          style: body1(_color),
        ),
      ],
    ),
  );
}

Widget productImageBox(
    BuildContext context, Product product, double _width, double _height, User user) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(user: user,
                      product: product,
                    )));
      },
      child: Container(
        width: _width,
        height: _height,
        color: Colors.grey,
        child: Image(
          image: FirebaseImage(product.imageURI[0],
              shouldCache: true,
              maxSizeBytes: 5000 * 1000,
              cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget collectionImageBox(BuildContext context, Collection collection,
    double _width, double _height, User user) {
  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CollectionDetailPage(
                      collection: collection,
                      user: user,
                    )));
      },
      child: Container(
        width: _width,
        height: _height,
        color: Colors.grey,
        child: Image(
          image: FirebaseImage(collection.imageURI,
              shouldCache: true,
              maxSizeBytes: 5000 * 1000,
              cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
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

Widget collectionShowcase(
    BuildContext context, Collection collection, User user) {
  const double _width = 240;
  const double _height = 160;
  const double _space1 = 8;
  const double _space2 = 6;

  bool isMyCollection = false;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        collectionImageBox(context, collection, _width, _height, user),
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
                    Text('@' + collection.userID),
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

Widget productItem1(BuildContext context, Product product, User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          productImageBox(context, product, 48, 48, user),
          wSpacer(12),
          Column(
            children: [
              Text(product.title),
              Text(product.price.toString()),
            ],
          ),
          Column(
            children: [
              Text(product.status.toString()),
              shortButton(context, offWhite, true, Text('리뷰 쓰기')),
            ],
          ),
        ],
      ),
      Row(
        children: [
          //profileImage(product.userID, 16),
          wSpacer(4),
          //Text(product.userID.username),
        ],
      )
    ],
  );
}
