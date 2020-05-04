import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';


class TwoInLine extends StatelessWidget {

  List<Widget> getProducts(BuildContext context) {
    List<Widget> collections = [];
    int index = 0;
    for (Product product in Products) {
      collections.add(getProduct(context, product, index));
      index ++;
    }
    return collections;
  }

  Widget getProduct(BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        height: 800,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
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
        height: 300,
        child: GridView.count(
          crossAxisCount: 2,
          children: getProducts(context),
        )
    );
  }
}