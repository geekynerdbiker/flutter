import 'package:artpia/pages/order/orderWork.dart';
import 'package:flutter/material.dart';

import 'package:artpia/pages/artwork/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ArtworkInfoPage extends StatelessWidget {
  // final Artwork artwork;

  // ArtworkInfoPage(this.artwork);
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
            otherArtwork(context),
            buyArtwork(context)
          ],
        ),
      ),
    );
  }

  // Widget sellerDetail(BuildContext context) {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //
  //   return FutureBuilder<DocumentSnapshot>(
  //     future: users.doc(this.artwork.uid).get(),
  //     builder: (BuildContext c, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasError) return ErrorAlertDialog();
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> data = snapshot.data.data();
  //         return Container(
  //           height: 150,
  //           child: Row(
  //             children: [
  //               CircleAvatar(
  //                 radius: 120,
  //               ),
  //               Center(
  //                 child: Text(data['username']),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //       return LoadingAlertDialog();
  //     },
  //   );
  // }

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
            child: Text(
              'artwork.title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            child: Text(
              '7000 ' + 'Won',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            child: Text('artwork.description'),
          )
        ],
      ),
    );
  }

  Widget otherArtwork(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Artist\'s Other artworks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                item(context),
                item(context),
                item(context),
                item(context),
                item(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            // onTap: () {
            //   Route route = MaterialPageRoute(
            //       builder: (context) => ArtworkDetailPage(artwork));
            //   Navigator.push(context, route);
            // },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.black)),
              width: width / 3,
              height: width / 3,
              // child: Image.netartwork(artwork.imageURL[0]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 30,
            child: Text(
              'artwork title',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }

  Widget buyArtwork(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 150,
      height: 50,
      child: InkWell(
          onTap: () {
            Route route =
                MaterialPageRoute(builder: (context) => OrderArtworkPage());
            Navigator.push(context, route);
          },
          child: Center(
            child: Text(
              "Purchase",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
