import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  String userID;

  String title;
  String imageURI;
  String description = '컬렉션 설명이 없습니다.';

  List<String> products = [];
  List<String> followers = [];
  List<String> tags = [];

  DocumentReference reference;

  Collection(this.title, this.userID, this.imageURI);

  Collection.fromMap(Map<String, dynamic> map, {this.reference})
      : userID = map['userID'],
        title = map['title'],
        imageURI = map['imageURI'],
        description = map['description'],
        products = List.from(map['products'],),
        followers = List.from(map['followers'],),
        tags = List.from(map['tags'],);

  Collection.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  int getProducts() {
    return this.products.length;
  }

  int getFollowers() {
    return this.followers.length;
  }
}
