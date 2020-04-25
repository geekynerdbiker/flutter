import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/testInput.dart';

class FeaturedCollection {
  String title;
  String tagURI;

  FeaturedCollection(this.title);
}
class FeaturedCollections extends StatelessWidget {

  List<Widget> getFeaturedCollections(BuildContext context) {
    List<Widget> fCollections = [];
    int index = 0;
    for (FeaturedCollection fCollection in fCollectionItems) {
      fCollections.add(getFeaturedCollection(context, fCollection, index));
      index ++;
    }
    return fCollections;
  }

  Widget getFeaturedCollection(BuildContext context, FeaturedCollection fCollections, int index) {
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
            fCollections.title,
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
        getFeaturedCollections(context),
      ),
    );
  }
}