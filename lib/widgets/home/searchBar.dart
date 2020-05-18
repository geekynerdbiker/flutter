import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.transparent,
      child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25.0,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 150,
                child: TextField(textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '검색어를 입력하세요'),
                ),
              ),
            ],
          )
        ),
      );
  }
}