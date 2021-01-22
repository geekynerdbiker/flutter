import 'package:flutter/material.dart';

//////////////////////////// User ////////////////////////////
class User {
  String username;
  String password;
  String contact;
  String eMail;

  String imageURI;
  String bio;

  List<String> followers = [];
  List<String> following = [];

  List<String> favorite = [];
  List<String> myProducts = [];

  // DocumentReference reference;
  //
  // User.fromMap(Map<String, dynamic> map, {this.reference})
  //     : username = map['username'],
  //       password = map['password'],
  //       contact = map['contact'],
  //       eMail = map['eMail'],
  //       imageURI = map['imageURI'],
  //       bio = map['bio'],
  //       followers = List.from(map['followers']),
  //       following = List.from(map['following']),
  //       favorite = List.from(map['favorite']),
  //       myProducts = List.from(map['myProducts']);
  //
  // User.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // User.getUserData(DocumentSnapshot snapshot)
  //     : this.username = snapshot.data['username'],
  //       this.password = snapshot.data['password'],
  //       this.contact = snapshot.data['contact'],
  //       this.eMail = snapshot.data['eMail'],
  //       this.imageURI = snapshot.data['imageURI'],
  //       this.bio = snapshot.data['bio'],
  //       this.followers = List<String>.from(snapshot.data['followers']),
  //       this.following = List<String>.from(snapshot.data['following']),
  //       this.favorite = List<String>.from(snapshot.data['favorite']),
  //       this.myProducts = List<String>.from(snapshot.data['myProducts']);

  Map<String, dynamic> toUserData() => {
        'username': username,
        'password': password,
        'contact': contact,
        'eMail': eMail,
        'imageURI': imageURI,
        'bio': bio,
        'followers': followers,
        'following': following,
        'favorite': favorite,
        'myProducts': myProducts,
      };
}

Widget profileImage(BuildContext context, User user) {
  String path = 'gs://artpia.appspot.com/user/' +
      user.username +
      '+' +
      'profile.jpg';
  // var image = FirebaseImage(path, shouldCache: true, maxSizeBytes: 20 * 1024 * 1024, cacheRefreshStrategy: CacheRefreshStrategy.BY_METADATA_DATE);

  return Container(
    child: CircleAvatar(
      // backgroundImage: image,
      backgroundColor: Colors.grey,
    ),
  );
}

//////////////////////////// Product ////////////////////////////
class Product {
  String userID;
  String title;
  String description;

  // String uploadDate;

  int price;
  int likes;
  String category;

  List<String> imageURI = [];
  List<String> tags = [];

  // DocumentReference reference;
  //
  //  Product.fromMap(Map<String, dynamic> map, {this.reference})
  //      : userID = map['userID'],
  //        title = map['title'],
  //        description = map['description'],
  //        price = map['price'],
  //        likes = map['likes'],
  //        category = map['category'],
  //        imageURI = List.from(map['imageURI']),
  //        tags = List.from(map['tags']);
  //
  //  Product.fromSnapshot(DocumentSnapshot snapshot)
  //      : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  //  Product.getProductData(DocumentSnapshot snapshot)
  //      : this.userID = snapshot.data['userID'],
  //        this.title = snapshot.data['title'],
  //        this.description = snapshot.data['description'],
  //        this.price = snapshot.data['price'],
  //        this.likes = snapshot.data['likes'],
  //        this.category = snapshot.data['catgory'],
  //        this.imageURI = List<String>.from(snapshot.data['imageURI']),
  //        this.tags = List<String>.from(snapshot.data['tags']);

  Map<String, dynamic> toProductData() => {
        'userID': userID,
        'title': title,
        'description': description,
        'price': price,
        'likes': likes,
        'category': category,
        'imageURI': imageURI,
        'tags': tags,
      };
}

//////////////////////////// Tag ////////////////////////////
class Tag {
  String tag;

  // DocumentReference reference;
  //
  // Tag.fromMap(Map<String, dynamic> map, {this.reference})
  //     : tag = map['tag'];
  //
  // Tag.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // Tag.getTagData(DocumentSnapshot snapshot)
  //     : this.tag = snapshot.data['tag'];

  Map<String, dynamic> toTagData() => {
        'tag': tag,
      };
}

//////////////////////////// Category ////////////////////////////
class Category {
  String level;
  String parent;
  String category;
  int itemCount;

  // DocumentReference reference;
  //
  // Category.fromMap(Map<String, dynamic> map, {this.reference})
  //     : level = map['level'],
  //       parent = map['parent'],
  //       category = map['category'],
  //       itemCount = map['itemCount'];
  //
  // Category.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // Category.getCategoryData(DocumentSnapshot snapshot)
  //     : this.level = snapshot.data['level'],
  //       this.parent = snapshot.data['parent'],
  //       this.category = snapshot.data['category'],
  //       this.itemCount = snapshot.data['itemCount'];

  Map<String, dynamic> toCategoryData() => {
        'level': level,
        'parent': parent,
        'category': category,
        'itemCount': itemCount,
      };
}
