import 'package:flutter/material.dart';

import 'package:newnew/widgets/product/products.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.75,
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      //Text('컬렉션', style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Scaffold(
            backgroundColor: Colors.white,
            body: new ListView(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("카테고리", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("상품명", style: TextStyle(fontSize: 15, ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("1000원", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("+ 배송료 3000원", style: TextStyle(fontSize: 12, ), ),
                              ),
                            ],
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
                                child: Text("사이즈: ", style: TextStyle(color: Colors.grey),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("상태: ", style: TextStyle(color: Colors.grey),),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("색상: ", style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("판매자", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text("아이디", style: TextStyle(),),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text("평점: 4.3", style: TextStyle(),),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width - 90,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(left: 8, right: 8),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "대화하기",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(width: 5,),
                                        Container(
                                          padding: EdgeInsets.only(left: 8, right: 8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "좋아요",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("상품 소개", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다. 상품 소개입니다.",
                            style: TextStyle(fontSize: 15, ),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("해시태그", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
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
                                      border: Border.all(color: Colors.black)
                                  ),
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
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 60,
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "태그2",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 60,
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "태그3",
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
