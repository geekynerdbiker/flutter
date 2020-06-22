import 'package:flutter/material.dart';
import 'package:editsource/models/classes/user.dart';

Container userCircle(BuildContext context, User user) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black,
          ),
          child: Center(
            child: Text(user.username, style: TextStyle(color: Colors.yellow)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}

// incomplete
Container userHorizontal(BuildContext context, User user) {
  return Container(
    height: 40,
    width: MediaQuery.of(context).size.width - 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.grey),
          child: Image.asset(
            user.imageURI,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              child: Text(
                user.username,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 100,
              child: Text(
                '*****' + ' (' + user.myProducts.length.toString() + ')',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
