import 'package:flutter/material.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/testInput.dart';

class SideScrollViewerVertical extends StatelessWidget {
  final int index;
  SideScrollViewerVertical(int index): this.index = index;

  List<Widget> getProducts(BuildContext context) {
    List<Widget> products = [];
    int pIndex = 0;
    for (Product product in userList[index].myProducts) {
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
          Image.asset(
            product.imageURI[0],
            fit: BoxFit.cover,
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(product.price.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
//              Material(
//                child: InkWell(
//                  child: Icon(Icons.favorite, size: 16,),
//                ),
//              )
//            ],
//          ),
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
