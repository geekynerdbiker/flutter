import 'package:flutter/material.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/pages/product/productDetailPage.dart';
import 'package:newnew/testInput.dart';

class Recommends extends StatelessWidget {
  List<Widget> getRecommends(BuildContext context) {
    List<Widget> products = [];
    int index = 0;
    for (Product product in productItems) {
      products.add(getRecommand(context, product, index));
      index++;
    }
    return products;
  }

  Widget getRecommand(BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
          },
          child: Container(
            width: 250,
            height: 200,
            child: Image.asset(
              product.imageURI[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: getRecommends(context),
        ));
  }
}
