import 'package:flutter/material.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

class TestBuilder extends StatefulWidget {
  final List<Product> products;
  TestBuilder({this.products});

  _TestBuilder createState() => _TestBuilder();
}

class _TestBuilder extends State<TestBuilder> {
  List<Product> products;
  List<String> titles;
  List<int> prices;
  List<String> imageURItests;

  @override
  void initState() {
    super.initState();
    products = widget.products;
    titles = products.map((p) => p.title).toList();
    prices = products.map((p) => p.price).toList();
    imageURItests = products.map((p) => p.imageURItest).toList();
  }

  List<Widget> getProducts(BuildContext context) {
    List<Widget> productList = [];
    int index = 0;

    for (Product product in products) {
      productList.add(getProduct(context, product, index));
      index++;
    }
    return productList;
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
                     // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));},
                      child: Image.asset(
                        product.imageURI[0],
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
