import 'package:flutter/material.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

import 'package:newnew/models/component.dart';

class Products extends StatelessWidget {
  final List<Product> productItems;
  Products(List<Product> productItems) : this.productItems = productItems;

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
        padding: EdgeInsets.all(0),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 260,
                    child: Image.asset(
                      product.imageURI,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2 - 2,
                          child: Text(
                            '3분 전',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 20,
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              child: Text(
                                product.category1.name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'M',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 20,
                          width: MediaQuery.of(context).size.width / 2 - 2,
                          child: Text(
                            product.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Container(
                             padding: EdgeInsets.only(left: 5),
                             height: 20,
                             width: MediaQuery.of(context).size.width / 2 - 30,
                             child: Text(
                               product.price.toString() + '원',
                               textAlign: TextAlign.left,
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 14,
                                   fontWeight: FontWeight.bold),
                             ),
                           ),
                           Icon(Icons.favorite, size: 15, color: Colors.black,)
                         ],
                       ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //height: MediaQuery.of(context).size.height - 180,
        child: GridView.count(
      crossAxisSpacing: 4,
      crossAxisCount: 2,
      childAspectRatio: 0.53,
      children: getProducts(context),
    ));
  }
}
