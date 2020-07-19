import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  String userID;

  String title;
  String imageURI;
  String description = '컬렉션 설명이 없습니다.';

  List<String> products = List<String>();
  List<String> followers = List<String>();
  List<String> tags = List<String>();

  bool canJoin;
  bool private;

  DocumentReference reference;

  Collection(this.title, this.userID, this.imageURI);

  Collection.fromMap(Map<String, dynamic> map, {this.reference})
      : userID = map['userID'],
        title = map['title'],
        imageURI = map['imageURI'],
        description = map['description'],
        products = List.from(
          map['products'],
        ),
        followers = List.from(
          map['followers'],
        ),
        tags = List.from(
          map['tags'],
        ),
        canJoin = map['canJoin'],
        private = map['private'];

  Collection.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Collection.getCollectionData(DocumentSnapshot snapshot)
      : this.userID = snapshot.data['userID'],
        this.title = snapshot.data['title'],
        this.imageURI = snapshot.data['imageURI'],
        this.description = snapshot.data['description'],
        this.products = List<String>.from(snapshot.data['products']),
        this.followers = List<String>.from(snapshot.data['followers']),
        this.tags = List<String>.from(snapshot.data['tags']),
        this.canJoin = snapshot.data['canJoin'],
        this.private = snapshot.data['private'];
}
