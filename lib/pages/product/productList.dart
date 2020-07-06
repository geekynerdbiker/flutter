import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  final String collectionName;
  ProductListPage({this.collectionName});
  @override
  _ProductListPage createState() => _ProductListPage();
}

class _ProductListPage extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '_title'),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        children: [
          itemList(context, widget.collectionName),
        ],
      ),
    );
  }

  Widget itemList(BuildContext context, String collectionName) {
    return FutureBuilder(
        future: getProducts(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading..'),
            );
          } else {
            return Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      DocumentSnapshot product = snapshot.data[index];
                      for (int i = 0;
                      i < product.data['collections'].length;
                      i++) {
                        if (product.data['collections'][index] !=
                            collectionName)
                          return Container();
                        else
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: productItemCardMedium(context, product),
                          );
                      }
                    }));
          }
        });
  }

  Future getProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn.documents;
  }
}
