import 'package:flutter/material.dart';

//import 'package:newnew/models/classes/product.dart';
import 'package:newnew/models/widgets/product.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

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
    return Material(
      child: InkWell(
        child: Container(
            padding: EdgeInsets.only(left: 10),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 280,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Material(
                    child: InkWell(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));},
                      child: Image.asset(
                        product.imageURI,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(height: 10),
                Container(
                    width: 200,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          product.title,
                          style: TextStyle(fontSize: 16),
                        ),
                        Material(
                          child: InkWell(
                            child: Icon(
                              Icons.favorite,
                              size: 16,
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                  width: 200,
                  height: 20,
                  child: Text(
                    product.price.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children: getProducts(context),
      ),
    );
  }
}
