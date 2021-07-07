import 'package:flutter/material.dart';

import 'package:artpia/pages/interface.dart';
import 'package:artpia/pages/search/module.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            // categoryPanel(context),
            recentSearch(context),
          ],
        ),
      ),
    );
  }

  // Widget categoryPanel(BuildContext context) {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //           width: MediaQuery.of(context).size.width,
  //           child: Text('category'),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [testItem(), testItem(), testItem()],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget recentSearch(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Search'),
              InkWell(
                onTap: () {
                  print("See All");
                },
                child: Text('See All'),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 300,
            child: ListView(
              children: [
                recentSearchItem(context, 'search1'),
                recentSearchItem(context, 'search2'),
                recentSearchItem(context, 'search3'),
                recentSearchItem(context, 'search4'),
                recentSearchItem(context, 'search5'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recentSearchItem(BuildContext context, String keyword) {
    return InkWell(
      onTap: () {
        Route route = new MaterialPageRoute(
            builder: (context) => InterfacePage(
                  searchResult: true, searchKeyword: keyword,
                ));
        Navigator.push(context, route);
      },
      child: Text(keyword),
    );
  }

  Widget testItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 80,
      height: 80,
    );
  }
}
