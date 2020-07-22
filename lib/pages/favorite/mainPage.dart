import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  User user;
  FavoritePage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'Likes'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        //shrinkWrap: true,
        children: [
          GridView.count(crossAxisCount: 2,
            childAspectRatio: 0.6,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
//              productItemCardLarge(context, new Product('title', 10000000, '/')),
//              productItemCardLarge(context, new Product('title', 10000000, '/')),
//              productItemCardLarge(context, new Product('title', 10000000, '/')),
//              productItemCardLarge(context, new Product('title', 10000000, '/')),

            ],)
        ],
      ),
    );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
    snapshot.map((e) => Product.fromSnapshot(e)).toList();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            child: ProductItemCardLarge(product: productItems[index], user: user),
          );
        },
    );
  }
}