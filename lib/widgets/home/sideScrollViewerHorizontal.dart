import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class SideScrollViewerHorizontal extends StatelessWidget {
  List<Widget> getCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Collection collection in collectionItems) {
      collections.add(getCollection(context, collection, index));
      index++;
    }
    return collections;
  }

  Widget getCollection(BuildContext context, Collection collection, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: <Widget>[
          Container(
            width: 280,
            height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset(
              collection.imageURI,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 100,
                    height: 20,
                    child: Text(collection.title.toString(), style: TextStyle(fontSize: 16),),),
                Material(
                  child: InkWell(
                    child: Icon(
                      Icons.favorite,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children: getCollections(context),
      ),
    );
  }
}
