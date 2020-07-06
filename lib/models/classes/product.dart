import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  User userID;

  String title;
  List<String> imageURI = [];
  String imageURITest;

  String description = '상품 설명이 없습니다.';
  String updateDate;
  String soldDate;

  int status = 0;
  int price;
  int deliveryFee;

  bool isLiked = false;

  Category category;

  List<Tag> tags = [];
  List<Review> reviews = [];
  List<Collection> collections = [];

  double rate = 0;

  DocumentReference reference;

  Product(this.title, this.price, this.imageURITest);

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : userID = map['userID'],
        title = map['title'],
        imageURI = map['imageURI'],
        description = map['description'],
        updateDate = map['updateDate'],
        soldDate = map['soldDate'],
        status = map['status'],
        price = map['price'],
        deliveryFee = map['deliveryFee'],
        isLiked = map['isLiked'],
        category = map['category'],
        tags = map['tags'],
        reviews = map['reviews'],
        collections = map['collections'],
        rate = map['rate'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  String getStaus() {
    if (this.status == 0)
      return '판매중';
    else if (this.status == 1)
      return '판매완료';
    else if (this.status == 2)
      return '배송완료';
    else if (this.status == 3)
      return '승인대기';
    else if (this.status == 4) return this.soldDate + ' 거래완료';
  }

  int getReviews() {
    return this.reviews.length;
  }

  double getRate() {
    for (int i = 0; i < reviews.length; i++) this.rate += reviews[i].rate;

    if (this.rate == 0) return 0;
    return this.rate / reviews.length;
  }
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
