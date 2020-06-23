import 'package:flutter/material.dart';

import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/collection.dart';

import 'package:editsource/pages/product/productDetailPage.dart';
import 'package:editsource/pages/collection/collectionDetailPage.dart';

Widget itemCardLarge(BuildContext context, Product product) {
  const double _width = 185;
  const double _height = 240;
  const double _space = 14;

  const double _tWidth = 141;
  const double _tHeight = 17;
  const double _tSpace = 4;

  const double _icon = 44;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tSpace + _tHeight,
      child: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            color: Colors.grey,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURItest,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: _space,
          ),
          Container(
            width: _width,
            height: _tHeight + _tSpace + _tHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: _tWidth,
                      height: _tHeight,
                      child: Text(product.title),
                    ),
                    Container(
                      height: _tSpace,
                    ),
                    Container(
                      width: _tWidth,
                      height: _tHeight,
                      child: Text(product.price.toString()),
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
          )
        ],
      ));
}

Widget itemCardMedium(BuildContext context, Product product) {
  const double _width = 160;
  const double _height = 200;
  const double _space = 14;

  const double _tWidth = 116;
  const double _tHeight = 17;
  const double _tSpace = 4;

  const double _icon = 44;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tSpace + _tHeight,
      child: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            color: Colors.grey,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURItest,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: _space,
          ),
          Container(
            width: _width,
            height: _tHeight + _tSpace + _tHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: _tWidth,
                      height: _tHeight,
                      child: Text(product.title),
                    ),
                    Container(
                      height: _tSpace,
                    ),
                    Container(
                      width: _tWidth,
                      height: _tHeight,
                      child: Text(product.price.toString()),
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
          )
        ],
      ));
}

Widget itemCardSmall(BuildContext context, Product product) {
  const double _width = 119;
  const double _height = 119;
  const double _space = 8;

  const double _tWidth = 119;
  const double _tHeight = 15;
  const double _tSpace = 4;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tSpace + _tHeight,
      child: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            color: Colors.grey,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURItest,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: _space,
          ),
          Container(
            width: _width,
            height: _tHeight + _tSpace + _tHeight,
            child: Column(
              children: [
                Container(
                  width: _tWidth,
                  height: _tHeight,
                  child: Text(product.title),
                ),
                Container(
                  height: _tSpace,
                ),
                Container(
                  width: _tWidth,
                  height: _tHeight,
                  child: Text(product.price.toString()),
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget collectionCoverCard(BuildContext context, Collection collection) {
  const double _width = 375;
  const double _height = 280;
  const double _space1 = 16;
  const double _space2 = 20;

  const double _tWidth = 310;
  const double _tHeight = 17;
  const double _tSpace1 = 7;
  const double _tSpace2 = 4;
  const double _tSpace3 = 16;

  const double _bWidth = 32;
  const double _bHeight = 15;

  const double _iWidth = 65;
  const double _iHeight = 24;

  return Container(
    width: _width,
    height: _height +
        _space1 +
        _tHeight +
        _tSpace1 +
        _bHeight +
        _space2 +
        _tHeight +
        _tSpace2 +
        _tHeight,
    child: Column(
      children: [
        Material(
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
              child: Image.asset(
                collection.imageURI,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: _space1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: _tWidth,
                  height: _tHeight,
                  child: Text(collection.title),
                ),
                Container(
                  height: _tSpace1,
                ),
                Row(
                  children: [
                    Container(
                      width: _bWidth,
                      height: _bHeight,
                      child: Text('아이템'),
                    ),
                    Container(
                      width: _tSpace2,
                    ),
                    Container(
                      width: _bWidth,
                      height: _bHeight,
                      child: Text(collection.products.length.toString()),
                    ),
                    Container(
                      width: _tSpace3,
                    ),
                    Container(
                      width: _bWidth,
                      height: _bHeight,
                      child: Text('팔로워'),
                    ),
                    Container(
                      width: _tSpace2,
                    ),
                    Container(
                      width: _bWidth,
                      height: _bHeight,
                      child: Text(collection.followers.toString()),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: _iWidth,
              height: _iHeight,
              child: Center(
                child: Text('+ Follow'),
              ),
            )
          ],
        ),
        Container(
          width: _space2,
        ),
        Container(
          width: _tWidth,
          height: _tHeight,
          child: Text(collection.userID.username),
        ),
        Container(
          width: _tSpace2,
        ),
        Container(
          width: _tWidth,
          height: _tHeight,
          child: Text(collection.subscription),
        ),
      ],
    ),
  );
}
