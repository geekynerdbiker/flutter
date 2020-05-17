import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class SideScrollViewerVertical extends StatelessWidget {

  List<Widget> getProducts(BuildContext context) {
    List<Widget> products = [];
    int index = 0;
    for (Product product in productItems) {
      products.add(getProduct(context, product, index));
      index ++;
    }
    return products;
  }

  Widget getProduct(BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 200,
        height: 280,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Image.asset(
            product.imageURI, fit: BoxFit.cover,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children:
        getProducts(context),
      ),
    );
  }
}