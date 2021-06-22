import 'package:flutter/material.dart';

import 'package:artpia/pages/search/module.dart';
import 'package:artpia/pages/artwork/artworkDetail.dart';

class SearchResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchResultAppBar(context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          physics: ClampingScrollPhysics(),
          childAspectRatio: 0.75,
          crossAxisCount: 2,
          shrinkWrap: true,
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
        ),
      ),
    );
  }
}

Widget item(BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          // Route route = createRoute(ArtworkDetailPage());
          Route route =
          MaterialPageRoute(builder: (context) => ArtworkDetailPage());
          Navigator.push(context, route);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.black)),
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: MediaQuery.of(context).size.width / 2 - 20,
          // child: Image.netartwork(artwork.imageURL[0]),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width / 2 - 20,
        height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'artwork title',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              textAlign: TextAlign.start,
            ),
            Text(
              'artist',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      )
    ],
  );
}
