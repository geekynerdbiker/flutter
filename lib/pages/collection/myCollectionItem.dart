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
  List<Widget> myProducts = [];
  List<Widget> usersProducts = [];

  @override
  Widget build(BuildContext context) {
    itemList(context, widget.isMine);

    print(280 *
        (widget.isMine ? myProducts.length : usersProducts.length / 2 + 1)
            .toDouble());

    return Container(
      height: 280 *
          (widget.isMine ? myProducts.length : usersProducts.length / 2 + 1)
              .toDouble(),
      child: GridView.count(
        crossAxisCount: 2,
        children: widget.isMine ? myProducts : usersProducts,
      ),
    );
  }

  void itemList(BuildContext context, bool isMine) {
    myProducts.clear();
    usersProducts.clear();

    for (int i = 0; i < widget.collection.products.length; i++) {
      Firestore.instance
          .collection('products')
          .document(widget.collection.products[i])
          .get()
          .then((e) {
        if (e.data['userID'] == widget.user.username) {
          myProducts.add(
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: productItemCardLarge(
                  context, Product.getProductData(e), widget.user),
            ),
          );
        } else {
          usersProducts.add(
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: productItemCardLarge(
                  context, Product.getProductData(e), widget.user),
            ),
          );
        }
      });
    }
  }

  Widget itemList2(BuildContext context, bool isMine) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductList(context, snapshot.data.documents, isMine);
      },
    );
  }

  Widget buildProductList(
      BuildContext context, List<DocumentSnapshot> snapshot, bool isMine) {
    List<Product> productItems =
        snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      height: 280 * (productItems.length / 2 + 1),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5),
          scrollDirection: Axis.vertical,
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            for (int i = 0; i < widget.collection.products.length; i++) {
              if (productItems[index].title == widget.collection.products[i]) {
                return productItemCardLarge(
                    context, productItems[index], widget.user);
              }
            }
            return Container();
          }),
    );
  }
}
