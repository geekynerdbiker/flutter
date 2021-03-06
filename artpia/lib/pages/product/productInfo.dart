import 'package:flutter/material.dart';

import 'package:artpia/assets/module.dart';
import 'package:artpia/pages/message/module.dart';
import 'package:artpia/pages/product/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductInfoPage extends StatelessWidget {
  final Product product;

  ProductInfoPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // sellerInfo(),
            // images(),
            // description(),
            // options(),
          ],
        ),
      ),
    );
  }

  Widget sellerInfo(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(this.product.uid).get(),
      builder: (BuildContext c, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) return ErrorAlertDialog();
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Container(
            height: 150,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 120,
                ),
                Center(
                  child: Text(data['username']),
                ),
              ],
            ),
          );
        }
        return LoadingAlertDialog();
      },
    );
  }

  Widget images(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(15),
      width: _width,
      height: _width * 9 / 16,
      color: Colors.blue,
    );
  }

  Widget description(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(product.description),
    );
  }

  Widget otherWork(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 400,
      child: Column(
        children: [
          Text('Artist\'s Other works'),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
              item(context, Product()),
            ],
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, Product product) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
                builder: (context) => ProductInfoPage(product));
            Navigator.push(context, route);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.blue)),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width / 2 - 30,
            height: MediaQuery.of(context).size.width / 2 - 30,
            child: Image.network(product.imageURL[0]),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: 30,
          child: Text(
            '[' + 'product title' + ']',
            style: TextStyle(fontWeight: FontWeight.w700),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
