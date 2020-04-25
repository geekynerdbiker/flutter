import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/testInput.dart';

class CommunityCollection {
  String title;
  String tagURI;

  CommunityCollection(this.title);
}
class CommunityCollections extends StatelessWidget {

  List<Widget> getCommunityCollections(BuildContext context) {
    List<Widget> cCollections = [];
    int index = 0;
    for (CommunityCollection cCollection in cCollectionItems) {
      cCollections.add(getCommunityCollection(context, cCollection, index));
      index ++;
    }
    return cCollections;
  }

  Widget getCommunityCollection(BuildContext context, CommunityCollection cCollections, int index) {
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
            cCollections.title,
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
        getCommunityCollections(context),
      ),
    );
  }
}