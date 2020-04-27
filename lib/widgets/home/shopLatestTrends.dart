import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class ShopLatestTrends extends StatelessWidget {

  List<Widget> getLatestTrends(BuildContext context) {
    List<Widget> latestTrends = [];
    int index = 0;
    for (Trend latestTrend in latestTrendItems) {
      latestTrends.add(getLatestTrend(context, latestTrend, index));
      index ++;
    }
    return latestTrends;
  }

  Widget getLatestTrend(BuildContext context, Trend latestTrend, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Container(
        width: 250,
        height: 100,
        padding: EdgeInsets.only(top: 5, left: 8, right: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: Text(
            latestTrend.title,
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
      height: 180,
      child: ListView(
        padding: EdgeInsets.only(left: 5, right: 15),
        scrollDirection: Axis.horizontal,
        children:
        getLatestTrends(context),
      ),
    );
  }
}