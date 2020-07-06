import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  User userID;

  String title;
  String imageURI;
  String description = '컬렉션 설명이 없습니다.';

  List<Product> products = [];
  List<User> followers = [];
  List<Tag> tags = [];

  DocumentReference reference;

  Collection(this.title, this.userID, this.imageURI);

  Collection.fromMap(Map<String, dynamic> map, {this.reference})
      : userID = map['userID'],
        title = map['title'],
        imageURI = map['imageURI'],
        description = map['description'],
        products = map['products'],
        followers = map['followers'],
        tags = map['tags'];

  Collection.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  int getProducts() {
    return this.products.length;
  }

  int getFollowers() {
    return this.followers.length;
  }
}
