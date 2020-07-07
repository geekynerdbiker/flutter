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
        ],
      ),
    );
  }
}