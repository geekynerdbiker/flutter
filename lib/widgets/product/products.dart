import 'package:flutter/material.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';

class Products extends StatelessWidget {
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
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: <Widget>[
            Container(
              height: 235,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
            ),
            Container(
              height: 80,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 170,
                    child: Text(
                      product.category1.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 170,
                    child: Text(
                      product.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 170,
                    child: Text(
                      product.price.toString() + '원',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: MediaQuery.of(context).size.height - 180,
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
          children: getProducts(context),
        ));
  }
}
