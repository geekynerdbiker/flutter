import 'package:editsource/models/classes/user.dart';

class Product {
  User userID;

  String title;
  String imageURItest;
  List<String> imageURI;
  int status = 0;

  int price;
  int deliveryFee;

  String description = '상품 설명이 없습니다.';
  String updatedDate;
  String soldDate;

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

  String getStaus() {
    if (this.status == 0)
      return '판매중';
    else if (this.status == 1)
      return '판매완료';
    else if (this.status == 2)
      return '배송완료';
    else if (this.status == 3)
      return '승인대기';
    else if (this.status == 4)
      return  this.soldDate + ' 거래완료';
  }

  int getReviews() {
    return this.reviews.length;
  }

  double getRate() {
    for (int i = 0; i < reviews.length; i++)
      this.rate += reviews[i].rate;

    if (this.rate == 0)
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

  Review(this.comment, this.updatedDate, this.productID);
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
