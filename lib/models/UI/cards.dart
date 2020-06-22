import 'package:flutter/material.dart';

import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/collection.dart';

import 'package:editsource/pages/product/productDetailPage.dart';
import 'package:editsource/pages/collection/collectionDetailPage.dart';

Container itemCardLarge(BuildContext context, Product product) {
  double _width = 185.5;
  double _height = 240;
  double _space = 14;

  double _tWidth = 141.5;
  double _tHeight = 17;
  double _tSpace = 4;

  double _icon = 44;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tHeight,
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
                  product.imageURI[0],
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
            height: _tHeight + _tHeight,
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

Container itemCardMedium(BuildContext context, Product product) {
  double _width = 160;
  double _height = 200;
  double _space = 14;

  double _tWidth = 116;
  double _tHeight = 17;
  double _tSpace = 4;

  double _icon = 44;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tHeight,
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
                  product.imageURI[0],
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
            height: _tHeight + _tHeight,
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

Container itemCardSmall(BuildContext context, Product product) {
  double _width = 119;
  double _height = 119;
  double _space = 8;

  double _tWidth = 119;
  double _tHeight = 15;
  double _tSpace = 4;

  return Container(
      width: _width,
      height: _height + _space + _tHeight + _tHeight,
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
                  product.imageURI[0],
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
            height: _tHeight + _tHeight,
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

Container collectionBanner(
    BuildContext context, Collection collection, double margin) {
  return Container(
    padding: EdgeInsets.all(margin),
    width: MediaQuery.of(context).size.width - margin,
    height: MediaQuery.of(context).size.width * 0.5 - margin,
    child: Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CollectionDetailPage(collection)));
        },
        child: Image.asset(
          collection.imageURI,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Container collectionBannerSquare(
    BuildContext context, Collection collection, double margin) {
  return Container(
    padding: EdgeInsets.all(margin),
    width: MediaQuery.of(context).size.width * 1 / 2 - margin,
    height: MediaQuery.of(context).size.width * 1 / 2 - margin,
    child: Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CollectionDetailPage(collection)));
        },
        child: Image.asset(
          collection.imageURI,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Container collectionBannerDetail(
    BuildContext context, Collection collection, double margin) {
  return Container(
      padding: EdgeInsets.all(margin),
      width: MediaQuery.of(context).size.width * 1 / 2 - margin,
      height: MediaQuery.of(context).size.width * 1 / 2 * 0.8 + 24 - margin,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1 / 2 - margin,
            height: MediaQuery.of(context).size.width * 1 / 2 * 0.8 - margin,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CollectionDetailPage(collection)));
                },
                child: Image.asset(
                  collection.imageURI,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 2 - margin,
            height: 24,
            child: Column(
              children: <Widget>[
                Text(collection.title +
                    '(' +
                    collection.products.length.toString() +
                    ')'),
                Text('by ' + collection.userID.username),
              ],
            ),
          )
        ],
      ));
}
