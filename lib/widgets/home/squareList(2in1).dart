import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class ShopByStyle2in1 extends StatelessWidget {

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
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 10, right: 10),
      crossAxisCount: 2,
      childAspectRatio: 2,
      children: getStyles(context),
    );
  }
}