import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/testInput.dart';

class ListCategory extends StatelessWidget {
  final List<Tag> categories;

  ListCategory(List<Tag> categories) : this.categories = categories;

  List<Widget> getCategories(BuildContext context) {
    List<Widget> tags = [];
    int index = 0;

    for (Tag tag in categories) {
      tags.add(getCategory(context, tag, index));
      index++;
    }
    return tags;
  }

  Widget getCategory(BuildContext context, Tag tag, int index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(border: Border(
        bottom: BorderSide(color: Colors.grey)
      )),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          tag.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: getCategories(context),
      ),
    );
  }
}
