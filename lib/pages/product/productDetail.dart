import 'package:flutter/material.dart';

import 'package:newnew/widgets/product/products.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.75,
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      //Text('컬렉션', style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Scaffold(
            backgroundColor: Colors.white,
            body: new ListView(
              children: <Widget>[

              ],
            ),
          ),
        ),
      ),
    );
  }
}
