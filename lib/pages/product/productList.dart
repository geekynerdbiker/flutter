import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  User user;
  Collection collection;

  ProductListPage({this.user, this.collection});

  @override
  _ProductListPage createState() => _ProductListPage();
}

class _ProductListPage extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, widget.collection.title),
      body: Container(child: productItemList(context),)
    );
  }

  Widget productItemList(BuildContext context) {
    print(Firestore.instance.collection('products'));

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.5),
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return Container(
            child: productItemCardLarge(context, productItems[index], widget.user),
          );
        },
    );
  }
}