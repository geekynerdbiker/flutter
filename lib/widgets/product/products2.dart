import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class Products2 extends StatelessWidget {
  List<Widget> getProducts2(BuildContext context) {
    List<Widget> products = [];
    int index = 0;
    for (Product product in productItems) {
      products.add(getProduct2(context, product, index));
      index++;
    }
    return products;
  }


  Widget getProduct2(
      BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        width: 250,
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
          child: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: GridView.count(
          crossAxisCount: 3,
          children: getProducts2(context),
        ));
  }
}
