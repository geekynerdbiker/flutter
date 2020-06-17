import 'package:flutter/material.dart';
import 'package:newnew/models/classes/product.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

Container productOneThird(BuildContext context, Product product, double margin) {
  return Container(
    padding: EdgeInsets.all(margin),
      width: MediaQuery.of(context).size.width * 1 / 3 - margin,
      height: MediaQuery.of(context).size.width * 1 / 3 - margin,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product)));
          },
          child: Image.asset(
            product.imageURI[0],
            fit: BoxFit.cover,
          ),
        ),
      ));
}

Container productOneThirdDetail(BuildContext context, Product product, double margin) {
  return Container(
      padding: EdgeInsets.all(margin),
      width: MediaQuery.of(context).size.width * 1 / 3 - margin,
      height: MediaQuery.of(context).size.width * 1 / 3 + 24 - margin,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3 - margin,
            height: MediaQuery.of(context).size.width * 1 / 3 - margin,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURI[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3 - margin,
            height: 12,
            child: Row(
              children: <Widget>[
                Text(product.title),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 3,
            height: 12,
            child: Text(product.price.toString()),
          ),
        ],
      ));
}

Container productVerticalDetail(BuildContext context, Product product, double margin) {
  return Container(
      padding: EdgeInsets.all(margin),
      width: MediaQuery.of(context).size.width * 2 / 5 - margin,
      height: MediaQuery.of(context).size.width * 2 / 5 * 1.4 + 24 - margin,
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 2 / 5 - margin,
              height: MediaQuery.of(context).size.width * 2 / 5 * 1.4 - margin,
              child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURI[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5 - margin,
            height: 12,
            child: Row(
              children: <Widget>[
                Text(product.title),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5 - margin,
            height: 12,
            child: Text(product.price.toString() + '원'),
          ),
        ],
      ));
}

Container productVerticalTimeDetail(BuildContext context, Product product, double margin) {
  return Container(
      padding: EdgeInsets.all(margin),
      width: MediaQuery.of(context).size.width * 2 / 5 - margin,
      height: MediaQuery.of(context).size.width * 2 / 5 * 1.4 + 34 - margin,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5 - margin,
            height: MediaQuery.of(context).size.width * 2 / 5 * 1.4 - margin,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product)));
                },
                child: Image.asset(
                  product.imageURI[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5 - margin,
            height: 22,
            child: Row(
              children: <Widget>[
                Column(children: <Widget>[
                  Text(product.updatedDate),
                  Text(product.title),
                ],),
                Icon(Icons.favorite),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5 - margin,
            height: 12,
            child: Text(product.price.toString() + '원'),
          ),
        ],
      ));
}
