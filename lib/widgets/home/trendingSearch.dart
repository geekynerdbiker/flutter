import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/models/trend.dart';
import 'package:newnewmarket/testInput.dart';

class TrendingSearch extends StatelessWidget {

  List<Widget> getTrends(BuildContext context) {
    List<Widget> trends = [];
    int index = 0;
    for (Trend trend in trendItems) {
      trends.add(getTrend(context, trend, index));
      index ++;
    }
    return trends;
  }

  Widget getTrend(BuildContext context, Trend trend, int index) {
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
            trend.title,
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