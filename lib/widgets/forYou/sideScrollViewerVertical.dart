import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

class SideScrollViewerVertical extends StatelessWidget {
  final List<Product> productItems;
  SideScrollViewerVertical(List<Product> productItems): this.productItems = productItems;

  List<Widget> getProducts(BuildContext context) {
    List<Widget> products = [];
    int pIndex = 0;
    for (Product product in productItems) {
      products.add(getProduct(context, product, pIndex));
      pIndex++;
    }
    return products;
  }

  Widget getProduct(BuildContext context, Product product, int pIndex) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
      width: MediaQuery.of(context).size.width * 1 / 3 - 20,
      height: MediaQuery.of(context).size.width * 1 / 3 - 20,
      child: Column(
        children: <Widget>[
          Material(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(product.price.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
              Material(
                child: InkWell(
                  child: Icon(Icons.favorite, size: 16,),
                ),
              )
            ],
          ),
        ],
      )
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
