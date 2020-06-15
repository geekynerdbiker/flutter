import 'package:flutter/material.dart';
import 'package:newnew/models/classes/product.dart';

Widget vertical(BuildContext context, Product product) {
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
        ],
      )
  );
}