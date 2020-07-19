import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatefulWidget {
  User user;
  Collection collection;
  bool isMine;

  CollectionItem({this.user, this.collection, this.isMine});

  @override
  _CollectionItem createState() => _CollectionItem();
}

class _CollectionItem extends State<CollectionItem> {

  @override
  Widget build(BuildContext context) {
    return widget.isMine ? myProductItemList(context) : userProductItemList(context);
  }

  Widget myProductItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('products')
          .where('collections',
          arrayContains:
          widget.collection.userID + '+' + widget.collection.title)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildMyProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildMyProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      height: 280 * (productItems.length / 2 + 1),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
              crossAxisCount: 2, childAspectRatio: 0.5),
          scrollDirection: Axis.vertical,
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            return productItemCardLarge(
                context,
                productItems[index], widget.user
            );
          }),
    );
  }

  Widget userProductItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('products')
          .where('collections',
          arrayContains:
          widget.collection.userID + '+' + widget.collection.title)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildUserProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildUserProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      height: 280 * (productItems.length / 2 + 1),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              crossAxisCount: 2, childAspectRatio: 0.5),
          scrollDirection: Axis.vertical,
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            if(productItems[index].userID != widget.collection.userID)
            return productItemCardLarge(
                context,
                productItems[index], widget.user
            );
          }),
    );
  }
}
