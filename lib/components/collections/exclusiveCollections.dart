import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/testInput.dart';

class ExclusiveCollection {
  String title;
  String tagURI;

  ExclusiveCollection(this.title);
}
class ExclusiveCollections extends StatelessWidget {

  List<Widget> getExclusiveCollections(BuildContext context) {
    List<Widget> eCollections = [];
    int index = 0;
    for (ExclusiveCollection eCollection in eCollectionItems) {
      eCollections.add(getExclusiveCollection(context, eCollection, index));
      index ++;
    }
    return eCollections;
  }

  Widget getExclusiveCollection(BuildContext context, ExclusiveCollection eCollections, int index) {
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
            eCollections.title,
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
        getExclusiveCollections(context),
      ),
    );
  }
}