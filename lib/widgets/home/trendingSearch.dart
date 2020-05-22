import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class TrendingSearch extends StatelessWidget {

  List<Widget> getTrends(BuildContext context) {
    List<Widget> tags = [];
    int index = 0;
    for (Tag tag in trendItems) {
      tags.add(getTrend(context, tag, index));
      index ++;
    }
    return tags;
  }

  Widget getTrend(BuildContext context, Tag tag, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: Text(
            tag.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children:
        getTrends(context),
      ),
    );
  }
}