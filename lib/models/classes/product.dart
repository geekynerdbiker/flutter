import 'package:editsource/models/classes/user.dart';

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
  List<Review> reviews = [];

  double rate = 0;
  int views;
  bool isSold;

  int getReviews() {
    return this.reviews.length;
  }

  double getRate() {
    for( int i = 0; i < reviews.length; i++ )
      this.rate += reviews[i].rate;

    if( this.rate == 0 )
      return 0;
    return this.rate / reviews.length;
  }

  Product(this.title, this.price, this.imageURItest);
}

class Review {
  User writer;
  String comment;
  String updatedDate;
  Product productID;
  double rate = 0;
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
