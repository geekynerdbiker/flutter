import 'package:flutter/material.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/widgets/collection/sideScrollViewerVertical.dart';

class UserCollections extends StatelessWidget {
  List<Widget> getUserCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Collection collection in collectionItems) {
      collections.add(getUserCollection(context, collection, index));
      index++;
    }
    return collections;
  }

  Widget getUserCollection(
      BuildContext context, Collection collections, int index) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width - 30,
            child: Text(user.username + '님의 컬렉션'),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 5/8,
            width: MediaQuery.of(context).size.width - 30,
            child: Image.asset('lib/assets/c1.png', fit: BoxFit.cover,),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 1/4,
            width: MediaQuery.of(context).size.width - 30,
            child: SideScrollViewerVertical(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: getUserCollections(context),
      ),
    );
  }
}
