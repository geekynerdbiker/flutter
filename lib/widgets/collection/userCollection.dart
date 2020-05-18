import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class UserCollections extends StatelessWidget {
  List<Widget> getUserCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Collection userCollection in userCollectionItems) {
      collections.add(getUserCollection(context, userCollection, index));
      index++;
    }
    return collections;
  }

  Widget getUserCollection(
      BuildContext context, Collection userCollections, int index) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        width: 250,
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
          child: Text(
            userCollections.title,
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
        child: GridView.count(
          crossAxisCount: 3,
          children: getUserCollections(context),
        ));
  }
}
