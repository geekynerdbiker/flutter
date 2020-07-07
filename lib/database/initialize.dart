import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget productItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('products').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return buildBody(context, snapshot.data.documents);
    },
  );
}

List<Product> getProductItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Product.fromSnapshot(e)).toList();
}

Widget collectionItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('collections').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return buildBody(context, snapshot.data.documents);
    },
  );
}

List<Collection> getCollectionItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Collection.fromSnapshot(e)).toList();
}

Widget userItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return buildBody(context, snapshot.data.documents);
    },
  );
}

List<User> getUserItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => User.fromSnapshot(e)).toList();
}

Widget tagsItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('tags').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return buildBody(context, snapshot.data.documents);
    },
  );
}

List<Tag> getTagItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((e) => Tag.fromSnapshot(e)).toList();
}

Widget reviewsItemList(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('reviews').snapshots(),
    builder: (context, snapshot) {
      if(!snapshot.hasData) return CircularProgressIndicator();
      return buildBody(context, snapshot.data.documents);
    },
  );
}

List<Review> getReviewItemList(BuildContext context, List<DocumentSnapshot> snapshot) {
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

void addProduct() {
  Firestore.instance.collection('products').add(
      {
        "userID" : "admin",
        "title" : "마르지엘라 흰색 타비 부츠",
        "description" : "송아지가죽 소재의 흰색 타비 부츠입니다. 굽8cm이지만 그렇게 높게 느껴지지않아요. 5번정도 신었음. 스크래치 거의 없고, 상태 양호.",
        "updateDate" : "2020/07/07",
        "soldDate" : "2020/07/07",
        "status" : 0,
        "price" : 480000,
        "deliveryFee" : 4000,
        "state" : 0,
        "size" : "",
        "material" : "",
       // "color" = FieldValue.arrayUnion(String s);
        "isLiked" : false,
        "category" : "여성 잡화",
        "rate" : 0.0
      });
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