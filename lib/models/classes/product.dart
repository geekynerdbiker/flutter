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

  bool payCard;
  String rate;
  String category;

  List<String> liked = [];
  List<String> tags = [];
  List<String> reviews = [];
  List<String> collections = [];

  DocumentReference reference;

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
        category = map['category'],
        liked = List.from(map['liked']),
        tags = List.from(map['tags']),
        reviews = List.from(
          map['reviews'],
        ),
        collections = List.from(
          map['collections'],
        ),
        payCard = map['payCard'],
        rate = map['rate'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Product.getProductData(DocumentSnapshot snapshot)
      : this.userID = snapshot.data['userID'],
        this.title = snapshot.data['title'],
        this.imageURI = List<String>.from(snapshot.data['imageURI']),
        this.description = snapshot.data['description'],
        this.updateDate = snapshot.data['updateDate'],
        this.soldDate = snapshot.data['soldDate'],
        this.status = snapshot.data['status'],
        this.price = snapshot.data['price'],
        this.deliveryFee = snapshot.data['deliveryFee'],
        this.state = snapshot.data['state'],
        this.size = snapshot.data['size'],
        this.material = snapshot.data['material'],
        this.color = List<String>.from(snapshot.data['color']),
        this.payCard = snapshot.data['payCard'],
        this.rate = snapshot.data['rate'],
        this.category = snapshot.data['catgory'],
        this.liked = List<String>.from(snapshot.data['liked']),
        this.tags = List<String>.from(snapshot.data['tags']),
        this.reviews = List<String>.from(snapshot.data['reviews']),
        this.collections = List<String>.from(snapshot.data['collections']);
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
