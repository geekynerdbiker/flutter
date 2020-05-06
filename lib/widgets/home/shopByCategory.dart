import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class ShopByCategory extends StatelessWidget {

  List<Widget> getCategories(BuildContext context) {
    List<Widget> categories = [];
    int index = 0;
    for (Category category in categoryItems) {
      categories.add(getCategory(context, category, index));
      index ++;
    }
    return categories;
  }

  Widget getCategory(BuildContext context, Category category, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
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
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 10, right: 10),
      crossAxisCount: 3,
      children: getCategories(context),
    );
  }
}