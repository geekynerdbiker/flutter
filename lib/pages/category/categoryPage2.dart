import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/product/addProductPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPage2 extends StatelessWidget {
  User user;
  String parentCategory;

  CategoryPage2({this.user, this.parentCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'General Category'),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
            child: categoryItemList(context)),
        Expanded(child: productItemList(context)),
      ]),
    );
  }

  Widget categoryItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('categories').where(
          'parent', isEqualTo: parentCategory).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildCategoryBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildCategoryBody(BuildContext context,
      List<DocumentSnapshot> snapshot) {
    List<Category> categoryItems =
    snapshot.map((e) => Category.fromSnapshot(e)).toList();

    List<Widget> categories = List<Widget>();

    for (int i = 0; i < categoryItems.length; i++)
      categories.add(categoryItemBuilder(context, categoryItems[i]));

    return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 4,
          children: categories,
        );
  }

  Widget categoryItemBuilder(BuildContext context, Category category) {
    if (category.parent == parentCategory)
      return Material(
        child: InkWell(
          onTap: () {
            print(category.title);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 0.5)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    category.title,
                    style: caption(primary),
                  ),
                  Text(
                    " " + category.itemCount.toString(),
                    style: caption(semiDark),
                  )
                ]),
              ),
            ),
          ),
        ),
      );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshots) {
        return buildProductItems(context, snapshots.data.documents);
      },
    );
  }

  Widget buildProductItems(BuildContext context,
      List<DocumentSnapshot> snapshot) {
    List<Product> productItems = snapshot.map((e) => Product.fromSnapshot(e))
        .toList();

    return GridView.builder(
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.5),
      itemCount: productItems.length,
      itemBuilder: (context, index) {
        return ProductItemCardLarge(user: user, product: productItems[index],);
      },
    );
  }
}
