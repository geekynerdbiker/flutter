import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/testInput.dart';
import 'package:newnewmarket/models/collection.dart';

class Collections extends StatelessWidget {

  List<Widget> getCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Collection collection in collectionItems) {
      collections.add(getCommunityCollection(context, collection, index));
      index ++;
    }
    return collections;
  }

  Widget getCommunityCollection(BuildContext context, Collection collections, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 250,
        height: 100,
        padding: EdgeInsets.only(top: 5, left: 8, right: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: Text(
            collections.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children:
        getCollections(context),
      ),
    );
  }
}