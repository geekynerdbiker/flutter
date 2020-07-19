import 'package:bak/models/classes/product.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/category/categoryPage2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '카테고리 선택'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: categoryItemList(context),
      ),
    );
  }
}

Widget categoryItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('categories').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();
      return buildCategoryBody(context, snapshot.data.documents);
    },
  );
}

Widget buildCategoryBody(
    BuildContext context, List<DocumentSnapshot> snapshot) {
  List<Category> categoryItems =
      snapshot.map((e) => Category.fromSnapshot(e)).toList();
  return ListView.builder(
      itemCount: categoryItems.length,
      itemBuilder: (context, index) {
        return Container(
          child: categoryItemBuilder(context, categoryItems[index]),
        );
      },
  );
}

Widget categoryItemBuilder(BuildContext context, Category category) {
  Category categoryItem;

  if (category.level == "1")
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: () async{
              categoryItem = await Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage2(parentCategory: category.title,)));
              Navigator.pop(context, categoryItem);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(category.title),
              ),
            ),
          ),
        ),
        borderLineGreyLite(context),
      ],
    );
  return null;
}
