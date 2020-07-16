import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String userID;

  String title;
  List<String> imageURI = [];

  String description;
  String updateDate;
  String soldDate;

  String status;
  String price;
  String deliveryFee;

  String state;
  String size;
  String material;
  List<String> color = [];

  String rate;
  String category;

  List<String> tags = [];
  List<String> reviews = [];
  List<String> collections = [];

  DocumentReference reference;

  Product.fromMap(Map <String, dynamic> map, {this.reference})
      : userID = map['userID'],
        title = map['title'],
        imageURI = List.from(map['imageURI']),
        description = map['description'],
        updateDate = map['updateDate'],
        soldDate = map['soldDate'],
        status = map['status'],
        price = map['price'],
        deliveryFee = map['deliveryFee'],
        state = map['state'],
        size = map['size'],
        material = map['material'],
        color = List.from(map['color']),
        category = map['category'],
        tags = List.from(map['tags']),
        reviews = List.from(
          map['reviews'],
        ),
        collections = List.from(
          map['collections'],
        ),
        rate = map['rate'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class Review {
  String userID;
  String productID;

  String comment;
  String updateDate;

  String rate;
  DocumentReference reference;

  Review(this.comment, this.updateDate, this.productID);

  Review.fromMap(Map<String, dynamic> map, {this.reference})
      : userID = map['userID'],
        productID = map['productID'],
        comment = map['comment'],
        updateDate = map['updateDate'],
        rate = map['rate'];

  Review.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class Tag {
  String title;
  bool isLiked;
  DocumentReference reference;

  Tag(this.title);

  Tag.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        isLiked = map['isLiked'];

  Tag.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class Category {
  String level;
  String parent;
  String title;

  DocumentReference reference;

  Category(this.title);

  Category.fromMap(Map<String, dynamic> map, {this.reference})
      : level = map['level'],
        parent = map['parent'],
        title = map['title'];

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
