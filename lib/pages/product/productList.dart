import 'package:flutter/material.dart';

import 'package:newnew/widgets/product/twoInLine.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Widget build(BuildContext context) {
    Widget appBar = new Container(
      child: AppBar(
        elevation: 0.75,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                    onPressed: () {
                      setState(() {
                      });
                    },
                  ),
                  Text('', style: TextStyle(color: Colors.black),)
                ],
              ),
            ],
          ),
        ),backgroundColor: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          appBar,
          new Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: new Text('N'+
                '개의 상품',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
