import 'package:flutter/material.dart';

import 'package:newnew/widgets/product/products.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String category1 = '대분류';
  String category2 = '중분류';
  String category3 = '소분류';

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
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: DropdownButton<String>(
                                value: category1,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 16,
                                elevation: 16,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                onChanged: (String newValue) {
                                  setState(() {
                                    category1 = newValue;
                                  });
                                },
                                items: <String>[
                                  '대분류',
                                  '테스트1',
                                  '테스트2',
                                  '테스트3'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: DropdownButton<String>(
                                value: category2,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 16,
                                elevation: 16,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                onChanged: (String newValue) {
                                  setState(() {
                                    category1 = newValue;
                                  });
                                },
                                items: <String>[
                                  '중분류',
                                  '테스트1',
                                  '테스트2',
                                  '테스트3'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: DropdownButton<String>(
                                value: category3,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 16,
                                elevation: 16,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                onChanged: (String newValue) {
                                  setState(() {
                                    category1 = newValue;
                                  });
                                },
                                items: <String>[
                                  '소분류',
                                  '테스트1',
                                  '테스트2',
                                  '테스트3'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '상품명을 입력하세요'
                            ),
                          ),
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
                                child: TextField(
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '가격을 입력하세요'
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: TextField(
                                  style: TextStyle(fontSize: 12,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '배송료를 입력하세요'
                                  ),
                                ),
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
                                child: Text(
                                  "사이즈: ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "상태: ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "색상: ",
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
                            "상품 소개",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            style: TextStyle(fontSize: 15,),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '내용을 입력하세요'
                            ),
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
                                      border: Border.all(color: Colors.black)),
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
