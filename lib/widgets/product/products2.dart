import 'package:flutter/material.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/pages/product/productDetailPage.dart';
import 'package:newnew/testInput.dart';

class Products2 extends StatelessWidget {
  final List<Product> productItems;
  Products2(List<Product> productItems) : this.productItems = productItems;
  List<Widget> getProducts2(BuildContext context) {
    List<Widget> products = [];
    int index = 0;
    for (Product product in productItems) {
      products.add(getProduct2(context, product, index));
      index++;
    }
    return products;
  }

  Widget getProduct2(BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        width: 250,
        height: 200,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
            },
            child: Image.asset(
              product.imageURI[0],
              fit: BoxFit.cover,
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
