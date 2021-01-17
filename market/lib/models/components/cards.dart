import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/collection.dart';

import 'package:bak/pages/product/productDetailPage.dart';
import 'package:bak/pages/collection/collectionDetailPage.dart';

class ProductItemCardLarge extends StatefulWidget {
  Product product;
  User user;
  Color color;

  ProductItemCardLarge({this.product, this.user, this.color});

  @override
  _ProductItemCardLarge createState() => _ProductItemCardLarge();
}

class _ProductItemCardLarge extends State<ProductItemCardLarge> {
  bool isLiked = false;

  Widget build(BuildContext context) {
    const double _width = 185;
    const double _height = 250;
    const double _space1 = 14;
    const double _space2 = 4;
    const double _icon = 44;

    for (int i = 0; i < widget.user.favorite.length; i++)
      if (widget.user.favorite[i] == widget.product.userID + '+' + widget.product.title)
        isLiked = true;

    return Container(
      width: _width,
      child: Column(
        children: <Widget>[
          productImageBox(context, widget.product, _width, _height, widget.user),
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
                        widget.product.title.length < 10
                            ? widget.product.title
                            : widget.product.title.substring(0, 10) + '..',
                        style: body1(primary),
                      ),
                      hSpacer(_space2),
                      Text(
                        widget.product.price.toString() + '원',
                        style: body1(primary),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        !isLiked
                            ? Firestore.instance
                            .collection('users')
                            .document(widget.user.username)
                            .updateData({
                          "favorite": FieldValue.arrayUnion([
                            widget.product.userID +
                                '+' +
                                widget.product.title
                          ])
                        }).then((value) {
                          Firestore.instance
                              .collection('products')
                              .document(widget.product.userID +
                              '+' +
                              widget.product.title)
                              .updateData({
                            "liked": FieldValue.arrayUnion(
                                [widget.user.username])
                          });
                          setState(() {
                            isLiked = !isLiked;
                          });
                        })
                            : Firestore.instance
                            .collection('users')
                            .document(widget.user.username)
                            .updateData({
                          "favorite": FieldValue.arrayRemove([
                            widget.product.userID +
                                '+' +
                                widget.product.title
                          ])
                        }).then((value) {
                          Firestore.instance
                              .collection('products')
                              .document(widget.product.userID +
                              '+' +
                              widget.product.title)
                              .updateData({
                            "liked": FieldValue.arrayRemove(
                                [widget.user.username])
                          });
                          setState(() {
                            isLiked = !isLiked;
                          });
                        });
                      },
                      child: Container(
                        width: _icon,
                        height: _icon,
                        child: Center(
                            child: !isLiked ? ImageIcon(
                              AssetImage(favorite_idle_inverse),
                              color: primary,
                            ) : ImageIcon(
                              AssetImage(favorite_active_inverse),
                              color: primary,
                            )
                        ),
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
}

class ProductItemCardMedium extends StatefulWidget {
  Product product;
  User user;
  Color color;

  ProductItemCardMedium({this.product, this.user, this.color});

  @override
  _ProductItemCardMedium createState() => _ProductItemCardMedium();
}

class _ProductItemCardMedium extends State<ProductItemCardMedium> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    const double _width = 160;
    const double _height = 200;
    const double _space1 = 14;
    const double _space2 = 4;
    const double _icon = 44;

    for (int i = 0; i < widget.user.favorite.length; i++)
      if (widget.user.favorite[i] == widget.product.userID + '+' + widget.product.title)
        isLiked = true;

    return Container(
      child: Column(
        children: <Widget>[
          productImageBox(context, widget.product, _width, _height, widget.user),
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
                        widget.product.title.length < 9
                            ? widget.product.title
                            : widget.product.title.substring(0, 8) + ' ..',
                        style: body1(widget.color),
                      ),
                      hSpacer(_space2),
                      Text(
                        widget.product.price.toString() + '원',
                        style: body1(widget.color),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        !isLiked
                            ? Firestore.instance
                            .collection('users')
                            .document(widget.user.username)
                            .updateData({
                          "favorite": FieldValue.arrayUnion([
                            widget.product.userID +
                                '+' +
                                widget.product.title
                          ])
                        }).then((value) {
                          Firestore.instance
                              .collection('products')
                              .document(widget.product.userID +
                              '+' +
                              widget.product.title)
                              .updateData({
                            "liked": FieldValue.arrayUnion(
                                [widget.user.username])
                          });
                          setState(() {
                            isLiked = !isLiked;
                          });
                        })
                            : Firestore.instance
                            .collection('users')
                            .document(widget.user.username)
                            .updateData({
                          "favorite": FieldValue.arrayRemove([
                            widget.product.userID +
                                '+' +
                                widget.product.title
                          ])
                        }).then((value) {
                          Firestore.instance
                              .collection('products')
                              .document(widget.product.userID +
                              '+' +
                              widget.product.title)
                              .updateData({
                            "liked": FieldValue.arrayRemove(
                                [widget.user.username])
                          });
                          setState(() {
                            isLiked = !isLiked;
                          });
                        });
                      },
                      child: Container(
                        width: _icon,
                        height: _icon,
                        child: Center(
                            child: !isLiked ? ImageIcon(
                              AssetImage(favorite_idle_inverse),
                              color: offWhite,
                            ) : ImageIcon(
                              AssetImage(favorite_active_inverse),
                              color: offWhite,
                            )
                        ),
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
}

Widget productItemCardSmall(BuildContext context, Product product, User user) {
  const double _width = 120;
  const double _height = 120;
  const double _space1 = 8;
  const double _space2 = 4;

  bool isMyProduct = false;

  return Container(
    margin: EdgeInsets.only(right: 15),
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
                  Text(product.price.toString() + '원'),
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
                    Text(collection.followers.length.toString()),
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

Widget collectionForMyPage(
    BuildContext context, Collection collection, User user) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.width * ( 260 / 375);
  const double _space1 = 12;
  const double _space2 = 6;

  bool isMyCollection = false;

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                collection.title +
                    ' (#' +
                    collection.products.length.toString() +
                    ')',
                style: body1(primary),
              ),
              hSpacer(_space2),
              Text(
                '@' + collection.userID,
                style: body1(primary),
              ),
            ],
          ),
        ),
        collectionImageBox(context, collection, _width, _height, user),
      ],
    ),
  );
}

Widget productImageBox(BuildContext context, Product product, double _width,
    double _height, User user) {
  return Material(
    child: InkWell(
      onTap: () {
        Firestore.instance
            .collection('users')
            .document(product.userID)
            .get()
            .then((e) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                        user: user,
                        product: product,
                        owner: User.getUserData(e),
                      )));
        });
      },
      child: Container(
        width: _width,
        height: _height,
        color: Colors.grey,
        child: Image(
          image: FirebaseImage(product.imageURI[0],
              shouldCache: true,
              maxSizeBytes: 20 * 1024 * 1024,
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
              maxSizeBytes: 20 * 1024 * 1024,
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
