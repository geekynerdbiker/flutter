import 'package:artpia/pages/product/modules.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/messege/modules.dart';

class ProductInfoPage extends StatefulWidget {
  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.width - 20,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
