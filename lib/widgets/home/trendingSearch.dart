import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class TrendingSearch extends StatelessWidget {

  List<Widget> getTrends(BuildContext context) {
    List<Widget> categories = [];
    int index = 0;
    for (Category category in trendItems) {
      categories.add(getTrend(context, category, index));
      index ++;
    }
    return categories;
  }

  Widget getTrend(BuildContext context, Category category, int index) {
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
            category.title,
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