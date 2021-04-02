import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:artpia/assets/module.dart';
import 'package:artpia/pages/home/module.dart';
import 'package:artpia/pages/artwork/artworkInfo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Colors.white,
      floatingActionButton: addArtworkFAT(context),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            physics: ClampingScrollPhysics(),
            childAspectRatio: 0.8,
            crossAxisCount: 2,
            children: [
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),

            ],
          )),
    );
  }
}

Widget item(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Route route = createRoute(ArtworkInfoPage());
          Navigator.push(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.blue)),
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: MediaQuery.of(context).size.width / 2 - 30,
          // child: Image.netartwork(artwork.imageURL[0]),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: 35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'artwork title',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              textAlign: TextAlign.start,
            ),
            Text('artist',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      )
    ],
  );
}
