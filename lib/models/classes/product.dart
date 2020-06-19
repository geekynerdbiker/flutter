import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newnew/models/classes/user.dart';

class Product {
  User userID;

  String title;
  String imageURItest;
  List<String> imageURI;

  int price;
  int deliveryFee;

  String description = '상품 설명이 없습니다.';
  String updatedDate;

  List<int> likes = [];
  List<Comment> comments = [];

  Tag category1;
  Tag category2;
  Tag category3;

  List<int> hashTags = [];

  double rate;
  int views;
  bool isSold;

  DocumentReference reference;

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        price = map['price'],
        imageURItest = map['imageURItest'];

  Product.fromSnapShot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class Review {
  User writer;
  String comment;
  String updatedDate;
  Product productID;
  double rate;
}

class Comment {
  int writer;
  String comment;
  String updatedDate;
  int productID;
}

class Tag {
  String name;

  Tag(this.name);
}
