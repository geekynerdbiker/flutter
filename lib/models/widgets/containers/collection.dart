import 'package:flutter/material.dart';
import 'package:newnew/models/classes/collection.dart';
import 'package:newnew/pages/forYou/collectionDetailPage.dart';

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
