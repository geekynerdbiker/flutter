import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/product/productInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/home/modules.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomScrollView(
          slivers: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('products')
                  .limit(20)
                  .orderBy('publishedDate', descending: true)
                  .snapshots(),
              builder: (context, dataSnapshot) {
                return !dataSnapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 2,
                        staggeredTileBuilder: (context) => StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          Product product = Product.fromJson(
                              dataSnapshot.data.docs[index].data());
                          return item(context, product);
                        },
                        itemCount: dataSnapshot.data.docs.length,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget item(BuildContext context, Product product) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (context) => ProductInfoPage(product));
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
