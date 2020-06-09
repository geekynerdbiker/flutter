import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/pages/product/productListPage.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/widgets/product/products.dart';
import 'package:newnew/widgets/product/products2.dart';


class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Container(
            height: MediaQuery.of(context).size.height - 400,
            child: Products(productItems),
      ),
    );
  }
}
