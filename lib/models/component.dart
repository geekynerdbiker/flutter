import 'package:flutter/material.dart';

class User {
  String username;
  String eMail;
  String phoneNumber;

  String profilePicture;
  List<User> followers = [];
  List<User> following = [];

  List<Product> myProducts = [];
  List<Collection> myCollection = [];

  DateTime lastSignIn;

  List<Post> posts = [];
  List<Post> savedPosts = [];

  User(this.username, this.profilePicture, this.followers, this.following, this.posts, this.savedPosts, this.myProducts);
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
  User user;
  String comment;
  DateTime dateOfComment;
  bool isLiked;

  Comment(this.user, this.comment, this.dateOfComment, this.isLiked);
}

class Tag {
  String name;

  Tag(this.name);
}

class Review {s
  User user;
  String comment;
  String updatedDate;
  Product product;
  double rate;

  Review(this.user, this.comment, this.rate, this.product);
}


class Collection {
  User owner;
  String title;
  String imageURI;
  String subscription = '컬렉션 설명이 없습니다.';
  List<Product> productList = [];


  Collection(this.owner, this.title, this.imageURI, this.productList);
}

class Product {
  String title;
  String imageURI;
  Tag category1;
  Tag category2;
  Tag category3;
  int price;
  String description = '상품 설명이 없습니다.';
  String owner;
  List<User> likes = [];
  List<Comment> comments = [];
  DateTime date;
  bool isLiked;
  bool isSaved;

  Product(this.owner, this.title, this.imageURI, this.category1, this.category2, this.category3, this.price);
  //Product(this.image, this.user, this.description, this.date, this.likes, this.comments, this.isLiked, this.isSaved);
}

class ProductLists {
  List<Product> myItems = [];
  List<Product> recentView = [];
  List<Product> wishList = [];

  ProductLists(this.myItems, this.recentView, this.wishList);
}