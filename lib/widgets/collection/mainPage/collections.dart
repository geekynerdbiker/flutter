import 'package:flutter/material.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';

class Collections extends StatelessWidget {

  List<Widget> getCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Collection collection in collectionItems) {
      collections.add(getCollection(context, collection, index));
      index ++;
    }
    return collections;
  }

  Widget getCollection(BuildContext context, Collection collections, int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 250,
        height: 200,
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
      height: 200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children:
        getCollections(context),
      ),
    );
  }
}