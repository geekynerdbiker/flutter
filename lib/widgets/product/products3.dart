import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/pages/product/productDetailPage.dart';
import 'package:newnew/testInput.dart';

class Products3 extends StatelessWidget {
  final List<Product> productItems;
  Products3(List<Product> productItems) : this.productItems = productItems;
  List<Widget> getProducts3(BuildContext context) {
    List<Widget> products = [];
    int index = 0;
    for (Product product in productItems) {
      products.add(getProduct3(context, product, index));
      index++;
    }
    return products;
  }

  Widget getProduct3(BuildContext context, Product product, int index) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          Container(
            width: 130,
            height: 130,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURI,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 20,
                  child: Text(product.title.toString(), style: TextStyle(fontSize: 16),),),
                Material(
                  child: InkWell(
                    child: Icon(
                      Icons.favorite,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 130,
            height: 20,
            child: Text(product.price.toString(), style: TextStyle(fontSize: 16),),),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5, left: 5),
      child: Container(
          height: 200,
          child: GridView.count(
            childAspectRatio: 0.65,
            crossAxisCount: 3,
            children: getProducts3(context),
          )),
    );
  }
}
