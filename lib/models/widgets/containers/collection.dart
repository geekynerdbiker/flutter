import 'package:flutter/material.dart';
import 'package:newnew/models/classes/collection.dart';
import 'package:newnew/pages/forYou/collectionDetailPage.dart';

Container collectionBanner(BuildContext context, Collection collection, double margin) {
  return Container(
    padding: EdgeInsets.all(margin),
    width: MediaQuery.of(context).size.width - margin,
    height: MediaQuery.of(context).size.width * 0.5 - margin,
    child: Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDetailPage(collection)));
        },
        child: Image.asset(collection.imageURI, fit: BoxFit.cover,),
      ),
    ),
  );
}