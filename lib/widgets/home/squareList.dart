import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class SquareList extends StatelessWidget {
  List<Widget> getProductLists(BuildContext context) {
    List<Widget> productLists = [];
    int index = 0;

    productLists.add(getRecentView(context, productListItem, index));
    productLists.add(getWishList(context, productListItem, index));
    productLists.add(getMyItems(context, productListItem, index));
    index++;

    return productLists;
  }

  Widget getMyItems(BuildContext context, ProductLists productList, int index) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Column(

          children: <Widget>[
            Text('내 상품', style: TextStyle(color: Colors.grey),),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)),
              child: Image.asset(
                productList.myItems[0].imageURI, fit: BoxFit.cover,
              ),
            ),
          ],
        )
    );
  }

  Widget getRecentView(BuildContext context, ProductLists productList,
      int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text('최근 본 상품', style: TextStyle(color: Colors.grey),),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset(
              productList.recentView[0].imageURI, fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget getWishList(BuildContext context, ProductLists productList, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text('찜 목록', style: TextStyle(color: Colors.grey),),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Image.asset(
              productList.wishList[0].imageURI, fit: BoxFit.cover,
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
