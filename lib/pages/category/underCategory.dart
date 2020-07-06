import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/product/addProductPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UnderCategoryPage extends StatelessWidget {
  String parent;
  UnderCategoryPage({this.parent});

  List<DocumentSnapshot> categories = <DocumentSnapshot> [];

  Future getCategories() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('categories').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '카테고리 선택'),
      body: categoryList(context),
    );
  }

  Widget categoryList(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            itemList(context),
          ],
        )
    );
  }

  Widget itemList(BuildContext context) {
    return FutureBuilder(
        future: getCategories(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading..'),
            );
          } else {
            return Expanded(
                child: ListView.builder(
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Material(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage(isCategorySelected: true, category: snapshot.data[index],)));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data[index].data['title']),
                                ),
                              ),
                            ),
                          ),
                          borderLineGreyLite(context),
                        ],
                      );
                    }));
          }
        });
  }
}
