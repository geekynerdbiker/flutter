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
  String webSite;

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
        eMail = map['eMail'],
        address = map['address'],
        createDate = map['createDate'],
        lastActivity = map['lastActivity'],
        rate = map['rate'],
        imageURI = map['imageURI'],
        name = map['name'],
        bio = map['bio'],
        webSite = map['webSite'],
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
          map['myProducts'],
        ),
        myCollections = List.from(map['myCollections']);

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  User.getUserData(DocumentSnapshot snapshot)
      : this.username = snapshot.data['username'],
        this.password = snapshot.data['password'],
        this.contact = snapshot.data['contact'],
        this.eMail = snapshot.data['eMail'],
        this.address = snapshot.data['address'],
        this.createDate = snapshot.data['createDate'],
        this.lastActivity = snapshot.data['lastActivity'],
        this.rate = snapshot.data['rate'],
        this.imageURI = snapshot.data['imageURI'],
        this.name = snapshot.data['name'],
        this.bio = snapshot.data['bio'],
        this.webSite = snapshot.data['webSite'],
        this.followers = List<String>.from(snapshot.data['followers']),
        this.following = List<String>.from(snapshot.data['following']),
        this.selectedFavor = List<String>.from(snapshot.data['selectedFavor']),
        this.reviews = List<String>.from(snapshot.data['reviews']),
        this.favorite = List<String>.from(snapshot.data['favorite']),
        this.myProducts = List<String>.from(snapshot.data['myProducts']),
        this.myCollections = List<String>.from(snapshot.data['myCollections']);

  Map<String, dynamic> toUserData() => {
    'username' : username,
    'password' : password,
    'contact' : contact,
    'eMail' : eMail,
    'address' : address,
    'createDate' : createDate,
    'lastActivity' : lastActivity,
    'rate' : rate,
    'imageURI' : imageURI,
    'name' : name,
    'bio' : bio,
    'webSite' : webSite,
    'followers' : followers,
    'following' : following,
    'selectedFavor' : selectedFavor,
    'reviews' : reviews,
    'favorite' : favorite,
    'myProducts' : myProducts,
    'myCollections' : myCollections,
  };
}

class EditProfileForm {
  String imageURI;
  String username;
  String name;
  String webSite;
  String bio;

  EditProfileForm(
      this.imageURI, this.username, this.name, this.webSite, this.bio);
}
