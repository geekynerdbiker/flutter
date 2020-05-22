import 'package:flutter/material.dart';

class User {
  String username;
  List<Post> posts;
  AssetImage profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;

  User(this.username, this.profilePicture, this.followers, this.following, this.posts, this.savedPosts);
}

class Post {
  AssetImage image;
  String description;
  User user;
  List<User> likes;
  List<Comment> comments;
  DateTime date;
  bool isLiked;
  bool isSaved;

  Post(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}

class Comment {
  String comment;
  User user;
  DateTime dateOfComment;
  bool isLiked;
  Comment(this.user, this.comment, this.dateOfComment, this.isLiked);
}

class Category {
  String title;
  String imageURI;

  Category(this.title);
}

class Collection {
  User owner;
  String imageURI;
  List<Product> collectionItems;

  Collection(this.owner, this.imageURI, this.collectionItems);
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

class Product {
  String title;
  String imageURI;
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

  Product(this.title, this.imageURI, this.category1, this.category2, this.category3, this.price);
  //Product(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}

class ProductLists {
  List<Product> myItems;
  List<Product> recentView;
  List<Product> wishList;

  ProductLists(this.myItems, this.recentView, this.wishList);
}