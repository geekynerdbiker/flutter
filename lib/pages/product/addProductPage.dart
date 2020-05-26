import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> with TickerProviderStateMixin {
  String category1 = '대분류';
  String category2 = '중분류';
  String category3 = '소분류';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 4 / 5,
        child: FloatingActionButton.extended(
            label: Text(
              "등록하기",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.black,
            onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.75,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
          child: Text(
            '상품',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: new ListView(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
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
                            items: <String>['대분류', '테스트1', '테스트2', '테스트3']
                                .map<DropdownMenuItem<String>>((String value) {
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
                                category2 = newValue;
                              });
                            },
                            items: <String>['중분류', '테스트1', '테스트2', '테스트3']
                                .map<DropdownMenuItem<String>>((String value) {
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
                                category3 = newValue;
                              });
                            },
                            items: <String>['소분류', '테스트1', '테스트2', '테스트3']
                                .map<DropdownMenuItem<String>>((String value) {
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
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '제품명'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                      left: 15,
                    ),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '제품 가격'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '  + 배송비: ',
                          style: TextStyle(fontSize: 12),
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '_________'),
                          ),
                        ),
                        Text(
                          '원',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: '내용을 입력하세요'),
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
                    padding: EdgeInsets.only(right: 15, left: 15, top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "해시태그",
                        style: TextStyle(
                          fontSize: 25,
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
                          Container(
                            height: 80,
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
    );
  }
}
