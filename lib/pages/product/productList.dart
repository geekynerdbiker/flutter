import 'package:flutter/material.dart';

import 'package:newnew/widgets/product/products.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
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
                new Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Text(
                    'N' + '개의 상품',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Products(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
