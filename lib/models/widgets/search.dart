import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchField createState() => _SearchField();
}

class _SearchField extends State<SearchField> {
  final Color idle = primary;
  final Color active = accent1;

  Color _color = primary;

  Widget build(BuildContext context) {
    return Container(
        width: 335,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: primary),
          color: Colors.white,
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.search,
                color: primary,
                size: 25.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: 150,
              child: TextFormField(
                textAlign: TextAlign.start,
                cursorColor: primary,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ));
  }
}