import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget getProductItemList(BuildContext context, Widget widget) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('products').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return widget;
    },
  );
}

List<Product> productItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Product.fromSnapshot(e)).toList();
}

Widget getCollectionItemList(BuildContext context, Widget widget) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('collections').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return widget;
    },
  );
}

List<Collection> collectionItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Collection.fromSnapshot(e)).toList();
}

Widget getUserItemList(BuildContext context, Widget widget) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return widget;
    },
  );
}

void getCurrentUserInfo(BuildContext context) {
  Firestore.instance.collection('users').snapshots().where((event) => false);
  
}

List<User> userItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => User.fromSnapshot(e)).toList();
}

Widget getTagItemList(BuildContext context, Widget widget) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('tags').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return widget;
    },
  );
}

List<Tag> tagItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Tag.fromSnapshot(e)).toList();
}

Widget getReviewItemList(BuildContext context, Widget widget) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('reviews').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return widget;
    },
  );
}

List<Review> reviewItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Review.fromSnapshot(e)).toList();
}

Widget buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
  List<Product> productItems =
      snapshot.map((e) => Product.fromSnapshot(e)).toList();
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productItems.length,
      itemBuilder: (context, index) {
        return productItemCardMedium(context, productItems[index], offWhite);
      },
    ),
  );
}


void addCollection() {
  Firestore.instance.collection('collections').add (
    {
      'userID' : '',
      'title' : '내맘대로 할거임',
      'imageURI' : '',
      'description' : '',
      'followers' : {},
      'products' : {},
      'tags' : {}
    }
  );
}

void dateTimeParser() {

}