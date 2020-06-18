import 'package:flutter/material.dart';

import 'package:newnew/models/classes/product.dart';
import 'package:newnew/testInput.dart';

class SquareList extends StatelessWidget {
  List<Widget> getProductLists(BuildContext context) {
    List<Widget> productLists = [];
    int index = 0;

    productLists.add(getRecentView(context, productItems, index));
    productLists.add(getWishList(context, productItems, index));
    productLists.add(getMyItems(context, productItems, index));
    index++;

    return productLists;
  }

  Widget getMyItems(BuildContext context, List<Product> productList, int index) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Column(

          children: <Widget>[
            Text('내 상품', style: TextStyle(color: Colors.grey),),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)),
              child: Image.asset(
                productList[0].imageURI[0], fit: BoxFit.cover,
              ),
            ),
          ],
        )
    );
  }

  Widget getRecentView(BuildContext context, List<Product> productList,
      int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text('최근 본 상품', style: TextStyle(color: Colors.grey),),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset(
              productList[0].imageURI[0], fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget getWishList(BuildContext context, List<Product> productList, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text('찜 목록', style: TextStyle(color: Colors.grey),),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset(
              productList[0].imageURI[0], fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 10, right: 10),
      childAspectRatio: 0.74,
      crossAxisCount: 3,
      children: getProductLists(context),
    );
  }
}
