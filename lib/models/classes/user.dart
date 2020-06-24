import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/collection.dart';

class User {
  String username;
  String password;
  String contact;
  String eMail;
  String address;
  String account;

  int createDate;
  int lastActivity;

  String imageURI;
  String bio;

  List<int> followers = [];
  List<int> following = [];
  List<int> selectedFavor = [];

  List<Product> favorite = [];
  List<Product> myProducts = [];
  List<Collection> myCollection = [];

  int getReviews() {
    int reviews = 0;

    for(int i = 0; i < myProducts.length; i++)
      reviews += myProducts[i].getReviews();

    return reviews;
  }

  double getRate() {
    double rate = 0;

    for(int i = 0; i < myProducts.length; i++)
      rate += myProducts[i].getRate();

    return rate / myProducts.length;
  }

  User(this.username, this.lastActivity, this.imageURI);
}
