import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) {
  child: Container(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColorLight,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
        ),
      ],
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        width: 1.0,
        color: Colors.black.withOpacity(0.05),
      ),
    ),
    child: Row(
      children: <Widget>[
        Icon(Icons.search, size: 24),
        SizedBox(width: 12.0),
        Text('text')
      ],
    ),
  );
}