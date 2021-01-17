import 'package:bak/models/components/border.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/search/mainPage.dart';
import 'package:flutter/material.dart';

Widget searchBarDisable(BuildContext context) {
  return Container(
    width: 335,
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(color: primary),
      color: offWhite,
    ),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Icon(
            Icons.search,
            color: primary,
            size: 25.0,
          ),
        ),
      ],
    ),
  );
}

Widget searchBarEnable(BuildContext context) {
  return Container(
    width: 335,
    height: 48,
    decoration: BoxDecoration(
      border: Border.all(color: accent1),
      color: offWhite,
    ),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          child: Icon(
            Icons.search,
            color: accent1,
            size: 25.0,
          ),
        ),
      ],
    ),
  );
}

class DataSearch extends SearchDelegate<String> {
  String search;

  List<Widget> buildActions(BuildContext context) {
    return [
      Material(
        child: InkWell(
          onTap: () {
            close(context, null);
          },
          child: Container(
            child: Text("취소"),
          ),
        ),
      )
    ];
  }

  Widget buildLeading(BuildContext context) {
    return Container();
  }

  Widget buildResults(BuildContext context) {
    return SearchResultPage(
      search: search,
    );
  }

  Widget buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("최근 검색어"),
        ),
        Container(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              recentSearchItem(BuildContext, 'search1'),
              recentSearchItem(BuildContext, 's2'),
              recentSearchItem(BuildContext, 'search2'),
              recentSearchItem(BuildContext, 's1'),
              recentSearchItem(BuildContext, 'search1adsfjkl'),
            ],
          ),
        ),
        hSpacer(20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("인기 검색어"),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text("keyword1"),
              Text("keyword2"),
              Text("keyword3"),
              Text("keyword4"),
              Text("keyword5"),
            ],
          ),
        ),
      ],
    );
  }

  Widget recentSearchItem(BuildContext, String string) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: string.length * 7 + 35.0,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: offWhite,
      ),
      child: Center(
        child: Text(string),
      ),
    );
  }
}
