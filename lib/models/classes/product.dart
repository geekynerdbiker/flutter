import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String userID;

  String title;
  List<String> imageURI = [];
  String imageRUITEST;

  String description = '상품 설명이 없습니다.';
  String updateDate;
  String soldDate;

  int status = 0;
  int price;
  int deliveryFee;

  int state;
  String size;
  String material;
  List<String> color = [];

  bool isLiked = false;

  String category;

  List<String> tags = [];
  List<String> reviews = [];
  List<String> collections = [];

  double rate = 0;

  DocumentReference reference;

  Product(this.title, this.price, this.imageRUITEST);

  Product.fromMap(Map<String, dynamic> map, {this.reference})
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
        isLiked = map['isLiked'],
        category = map['category'],
        tags = List.from(map['tags']),
        reviews = List.from(map['reviews'],),
        collections = List.from(map['collections'],),
        rate = map['rate'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  int getReviews() {
    return this.reviews.length;
  }

//  double getRate() {
//    for (int i = 0; i < reviews.length; i++) this.rate += reviews[i].rate;
//
//    if (this.rate == 0) return 0;
//    return this.rate / reviews.length;
//  }
}

class Review {
  User userID;
  Product productID;

  String comment;
  String updateDate;

  double rate = 0;
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
  int level;
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
