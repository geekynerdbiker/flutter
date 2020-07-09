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

  String rate;

  String imageURI;
  String name;
  String bio;

  List<String> followers = [];
  List<String> following = [];
  List<String> selectedFavor = [];
  List<String> reviews = [];

  List<String> favorite = [];
  List<String> myProducts = [];
  List<String> myCollections = [];

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
        followers = List.from(
          map['followers'],
        ),
        following = List.from(
          map['following'],
        ),
        selectedFavor = List.from(
          map['selectedFavor'],
        ),
        reviews = List.from(
          map['reviews'],
        ),
        favorite = List.from(
          map['favorite'],
        ),
        myProducts = List.from(
          map['myProduct'],
        ),
        myCollections = List.from(map['myCollection']);

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  User(this.username);

}

class EditProfileForm {
  String imageURI;
  String username;
  String name;
  String webSite;
  String bio;

  EditProfileForm(this.imageURI, this.username, this.name, this.webSite, this.bio);
}
