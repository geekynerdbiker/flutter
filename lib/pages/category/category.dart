import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/category/underCategory.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          categoryItem(context, 'category 1', new Category()),
          categoryItem(context, 'category 2', new Category()),
          categoryItem(context, 'category 3', new Category()),
        ],
      ),
    );
  }

  Widget categoryItem(BuildContext context, String _textContext, Category _category) {
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UnderCategoryPage(_category)));
            },
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
