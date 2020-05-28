import 'package:flutter/material.dart';
import 'package:newnew/pages/forYou/collectionDetailPage.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/widgets/forYou/sideScrollViewerVertical.dart';

class MyCollections extends StatelessWidget {
  List<Widget> getCollections(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;

    for (Collection collection in collectionItems) {
      collections.add(getCollection(context, collection, index));
      index++;
    }
    return collections;
  }

  Widget getCollection(
      BuildContext context, Collection collection, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: <Widget>[
                    Text(
                      collection.title + ' ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(' + collection.productList.length.toString() + ')',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.of(context).size.width - 30,
                child: Text(
                  'by ' + collection.owner.username,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.width * 5 / 8,
              width: MediaQuery.of(context).size.width - 40,
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionDetailPage(collection)));
                  },
                  child: Image.asset(
                    collection.imageURI,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.width * 1 / 3 + 34,
            width: MediaQuery.of(context).size.width - 20,
            child: SideScrollViewerVertical(collection.productList),
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
        children: getCollections(context),
      ),
    );
  }
}
