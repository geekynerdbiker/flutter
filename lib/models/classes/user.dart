import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String password;
  String contact;
  String eMail;
  String address;

  String createDate;
  String lastActivity;

  double rate = 0;

  String imageURI;
  String name;
  String bio;

  List<User> followers = [];
  List<User> following = [];
  List<User> selectedFavor = [];

  List<Product> favorite = [];
  List<Product> myProducts = [];
  List<Collection> myCollections = [];

  DocumentReference reference;

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : username = map['username'],
        password = map['password'],
        contact = map['contact'],
        eMail = map['email'],
        address = map['address'],
        createDate = map['createDate'],
        lastActivity = map['lastActivity'],
        rate = map['rate'],
        imageURI = map['imageURI'],
        name = map['name'],
        bio = map['bio'],
        followers = map['followers'],
        following = map['following'],
        selectedFavor = map['selectedFavor'],
        favorite = map['favorite'],
        myProducts = map['myProduct'],
        myCollections = map['myCollection'];

  User.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference : snapshot.reference);


  int getFollowers() {
    return this.followers.length;
  }

  int getFollowing() {
    return this.following.length;
  }

  int getMyProducts() {
    return this.myProducts.length;
  }

  int getReviews() {
    int reviews = 0;

    for (int i = 0; i < myProducts.length; i++)
      reviews += myProducts[i].getReviews();

    return reviews;
  }

  double getRate() {
    for (int i = 0; i < myProducts.length; i++)
      this.rate += myProducts[i].getRate();

    if (this.rate == 0) return 0;
    return this.rate / myProducts.length;
  }

  User(this.username, this.lastActivity, this.imageURI);
}
