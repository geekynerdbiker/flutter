import 'package:editsource/pages/home/account/selectFavor2.dart';
import 'package:flutter/material.dart';

class SelectFavorPage extends StatelessWidget {
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
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            //HashTagList(),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectFavorPage2()));
                },
                child: Container(
                  height: 40,
                  width: 120,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '다음 단계',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
