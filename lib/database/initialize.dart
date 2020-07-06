import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCRUD extends StatefulWidget {
  String collectionName;

  FirestoreCRUD({Key key, this.collectionName}) : super(key: key);

  @override
  FirestoreCRUDState createState() => FirestoreCRUDState();
}

class FirestoreCRUDState extends State<FirestoreCRUD> {
  Firestore firestore = Firestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection(widget.collectionName).snapshots();
  }

//  Widget fetchData(BuildContext context, String collectionName) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection(collectionName).snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//        return buildBody(context, snapshot.data.documents, collectionName);
//      },
//    );
//  }

  List<User> getUserList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<User> users = snapshot.map((d) => User.fromSnapshot(d)).toList();
    return users;
  }

  List<Collection> getCollectionList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collections =
        snapshot.map((d) => Collection.fromSnapshot(d)).toList();
    return collections;
  }

  List<Product> getProductList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> products =
        snapshot.map((d) => Product.fromSnapshot(d)).toList();
    return products;
  }

  List<Review> getReviewList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Review> reviews = snapshot.map((d) => Review.fromSnapshot(d)).toList();
    return reviews;
  }

  List<Tag> getTagList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Tag> tags = snapshot.map((d) => Tag.fromSnapshot(d)).toList();

    return tags;
  }

  List<Category> getCategoryList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Category> categories =
        snapshot.map((d) => Category.fromSnapshot(d)).toList();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getProducts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Loading..'),
                );
              } else {
                return ListView.builder(itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].data['title']),
                  );
                });
              }
            }));
  }

  Future getProducts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn.documents;
  }

  Future getCollections() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('collections').getDocuments();
    return qn.documents;
  }
}
