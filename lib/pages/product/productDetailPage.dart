import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  ProductDetailPage(Product product): this.product = product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black)),
            child: FloatingActionButton.extended(
                heroTag: "chat",
                label: Text(
                  "대화하기",
                  style: TextStyle(color: Colors.black),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.white,
                onPressed: () {}),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 2 / 5,
            child: FloatingActionButton.extended(
                heroTag: "buy",
                label: Text(
                  "구매하기",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.black,
                onPressed: () {}),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      appBar: appBarDefaultDeep(context, '상품 상세'),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: new ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Text(
                          product.userID.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Text(
                          "평점: 4.3",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width,
              child: Image.asset(product.imageURI[0], fit: BoxFit.cover,),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        product.price.toString() + '원',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "+ 배송비 3000원",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "  사이즈: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "  상태: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "  소재: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "  색상: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "해시태그",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        width: 60,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            "태그1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
