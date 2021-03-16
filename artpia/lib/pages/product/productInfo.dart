import 'package:flutter/material.dart';

import 'package:artpia/assets/module.dart';
import 'package:artpia/pages/product/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductInfoPage extends StatelessWidget {
  // final Product product;

  // ProductInfoPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            // sellerInfo(),
            images(context),
            description(context),
            otherWork(context),
          ],
        ),
      ),
    );
  }

  // Widget sellerInfo(BuildContext context) {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //
  //   return FutureBuilder<DocumentSnapshot>(
  //     future: users.doc(this.product.uid).get(),
  //     builder: (BuildContext c, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasError) return ErrorAlertDialog();
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> data = snapshot.data.data();
  //         return Container(
  //           height: 150,
  //           child: Row(
  //             children: [
  //               CircleAvatar(
  //                 radius: 120,
  //               ),
  //               Center(
  //                 child: Text(data['username']),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //       return LoadingAlertDialog();
  //     },
  //   );
  // }

  Widget images(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 3 / 4,
      color: Colors.blue,
    );
  }

  Widget description(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  'product.title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Container(
                child: Text(
                  'product.price7000' + 'won',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text('product.description'),
          )
        ],
      ),
    );
  }

  Widget otherWork(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Artist\'s Other works',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                item(context),
                item(context),
                item(context),
                item(context),
                item(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            // onTap: () {
            //   Route route = MaterialPageRoute(
            //       builder: (context) => ProductInfoPage(product));
            //   Navigator.push(context, route);
            // },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.blue)),
              width: width / 3,
              height: width / 3,
              // child: Image.network(product.imageURL[0]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 30,
            child: Text(
              'product title',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
