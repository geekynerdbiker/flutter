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
      index++;
    }
    return products;
  }

  Widget getProduct(BuildContext context, Product product, int index) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      width: 100,
      height: 100,
      child: Image.asset(
        product.imageURI,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getProducts(context),
      ),
    );
  }
}
