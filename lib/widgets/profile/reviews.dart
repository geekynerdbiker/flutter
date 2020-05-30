import 'package:flutter/material.dart';
import 'package:newnew/pages/forYou/collectionDetailPage.dart';
import 'package:newnew/pages/product/productDetailPage.dart';

import 'package:newnew/testInput.dart';
import 'package:newnew/models/component.dart';
import 'package:newnew/widgets/forYou/sideScrollViewerVertical.dart';

class Reviews extends StatelessWidget {
  List<Widget> getReviews(BuildContext context) {
    List<Widget> reviews = [];
    int index = 0;

    for (Review review in reviewItems) {
      reviews.add(getReview(context, review, index));
      index++;
    }
    return reviews;
  }

  Widget getReview(BuildContext context, Review review, int index) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        user.profilePicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(review.user.username),
                        Text(review.rate.toString()),
                      ],
                    ),
                  ],
                ),
                Text(
                  '7시간 전',
                ),
              ]),
          Padding(
              padding: EdgeInsets.only(top: 10, left: 40),
              child: Text(
                review.comment,
                textAlign: TextAlign.left,
              )),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 40),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '구매상품 ㅣ ',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(review.product.title),
                      ),
                    ],
                  ),
                  Material(
                    color: Colors.grey[200],
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(review.product)));
                      },
                        child: Icon(Icons.chevron_right)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: getReviews(context),
      ),
    );
  }
}
