import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';

class Collection {
  User userID;

  String title;
  String imageURI;
  String subscription = '컬렉션 설명이 없습니다.';

  List<Product> products = [];
  List<int> followers = [];
  List<int> hashTags = [];

  int getProducts() {
    return this.products.length;
  }

  int getFollowers() {
    return this.followers.length;
  }
  int views;

  Collection(this.title, this.userID, this.imageURI);
}