import 'package:flutter/material.dart';
import 'package:newnew/models/component.dart';


class CollectionDetailPage extends StatelessWidget {
  final Collection collection;
  CollectionDetailPage(Collection collection): this.collection = collection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('모든 컬렉션', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        leading: BackButton(
          color: Colors.black
        ),
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      body: Padding(
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
                        '(' + collection.getSize().toString() + ')',
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
                    'by NEWNEW',
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
              child: Image.asset(
                collection.imageURI,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 1 / 3 + 34,
              width: MediaQuery.of(context).size.width - 20,
            ),
          ],
        ),
      ),
    );
  }
}
