import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/category/categoryPage2.dart';
import 'package:flutter/material.dart';

class FavorPage extends StatelessWidget {
  User user;

  FavorPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        physics: ClampingScrollPhysics(),
        children: [
          categoryItem(context, 'category 1', new Category('1')),
          categoryItem(context, 'category 2', new Category('2')),
          categoryItem(context, 'category 3', new Category('3')),
        ],
      ),
    );
  }

  Widget categoryItem(BuildContext context, String _textContext, Category _category) {
    return Column(
      children: [
        Material(
          child: InkWell(
//            onTap: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage2(_category)));
//            },
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
