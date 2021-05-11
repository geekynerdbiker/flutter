import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget artworkAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        'Artwork Detail',
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(CupertinoIcons.clear),
    ),
  );
}

Widget addArtworkAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        'Add Artwork',
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(CupertinoIcons.clear),
    ),
  );
}
