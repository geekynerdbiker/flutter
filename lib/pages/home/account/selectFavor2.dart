import 'package:flutter/material.dart';

class SelectFavorPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Text(
            '취향 선택',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Container(
            child: Material(
              color: Colors.white,
              child: InkWell(
                  child: Container(
                padding: EdgeInsets.only(top: 15),
                width: 60,
                child: Text('건너뛰기'),
              )),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 120,
        child: FloatingActionButton.extended(
            heroTag: "confirm",
            label: Text(
              "선택 완료",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            backgroundColor: Colors.black,
            onPressed: () {}),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              //child: SquareList2in1(),
            ),
          ],
        ),
      ),
    );
  }
}
