import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/models/style.dart';
import 'package:newnewmarket/testInput.dart';

class ShopByStyle extends StatelessWidget {

  List<Widget> getStyles(BuildContext context) {
    List<Widget> styles = [];
    int index = 0;
    for (Style style in styleItems) {
      styles.add(getStyle(context, style, index));
      index ++;
    }
    return styles;
  }

  Widget getStyle(BuildContext context, Style style, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 10,width: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: Text(
            style.title,
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
    return GridView.count(
      padding: EdgeInsets.only(left: 10, right: 10),
      crossAxisCount: 2,
      childAspectRatio: 2,
      children: getStyles(context),
    );
  }
}