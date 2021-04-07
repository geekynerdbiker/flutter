import 'package:artpia/pages/order/orderArtwork.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/artwork/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddArtworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: artworkAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // sellerDetail(),
            images(context),
            description(context),
          ],
        ),
      ),
      floatingActionButton: addArtwork(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget images(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 3 / 4,
      color: Colors.black,
    );
  }

  Widget description(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text('Title of Artwork'),
                ),
              ],
            ),
          ),Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text('Price of Artwork'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Text('Description of Artwork'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addArtwork(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              "Add Artwork",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
