import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
//  Collection _collection;
//
//  ProductList(Collection _collection) {
//    this._collection = _collection;
//  }

  @override
  _ProductList createState() => _ProductList();
}

class _ProductList extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '_title'),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        children: [
          productItemCardLarge(context, new Product('title', 10000, '/')),
          productItemCardLarge(context, new Product('title', 10000, '/')),
          productItemCardLarge(context, new Product('title', 10000, '/')),
          productItemCardLarge(context, new Product('title', 10000, '/')),
          productItemCardLarge(context, new Product('title', 10000, '/')),
          productItemCardLarge(context, new Product('title', 10000, '/')),
        ],
      ),
    );
  }
}
