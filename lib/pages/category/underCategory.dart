import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:flutter/material.dart';

class UnderCategoryPage extends StatelessWidget {
  Category _category;
  UnderCategoryPage(Category _category) {
    this._category = _category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          categoryItem(context, 'category 1'),
          categoryItem(context, 'category 2'),
          categoryItem(context, 'category 3'),
        ],
      ),
    );
  }

  Widget categoryItem(BuildContext context, String _textContext) {
    return Column(
      children: [
        Material(
          child: InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(_textContext),
              ),
            ),
          ),
        ),
        borderLineGreyLite(context),
      ],
    );
  }
}
