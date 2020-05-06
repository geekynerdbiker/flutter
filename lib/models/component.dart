import 'package:flutter/material.dart';
import 'user.dart';

class Category {
  String title;
  String imageURI;

  Category(this.title);
}

class Collection {
  String title;
  String tagURI;

  Collection(this.title);
}

class Designer {
  String title;
  String imageURI;

  Designer(this.title);
}

class Style {
  String title;
  String imageURI;

  Style(this.title);
}

class Trend {
  String title;
  String tagURI;

  Trend(this.title);
}

class Product {
  String title;
  AssetImage image;
  Category category1;
  Category category2;
  Category category3;
  int price;
  String description;
  User user;
  List<User> likes;
  List<Comment> comments;
  DateTime date;
  bool isLiked;
  bool isSaved;

  Product(this.title, this.category1, this.category2, this.category3, this.price);
  //Product(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}