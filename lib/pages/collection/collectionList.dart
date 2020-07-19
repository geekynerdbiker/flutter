import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/collection/addCollection.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:bak/pages/product/addProductPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CollectionListPage extends StatefulWidget {
  User user;
  Product product;

  CollectionListPage({this.user, this.product});

  @override
  _CollectionListPage createState() => _CollectionListPage();
}

class _CollectionListPage extends State<CollectionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '컬렉션에 추가'),
      body: ListView(
        shrinkWrap: true,
        children: [
          productInfo(context),
          myCollectionList(context),
          collectionItems(context),
        ],
      ),
    );
  }

  Widget productInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * (280 / 375),
          child: Image(
            image: FirebaseImage(widget.product.imageURI[0],
                shouldCache: true,
                maxSizeBytes: 20 * 1024 * 1024,
                cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.product.title),
              Row(
                children: [
                  Text(widget.product.price),
                  Text(' @' + widget.product.userID),
                ],
              ),
            ],
          ),
        ),
        borderLineGreyLite(context),
      ],
    );
  }

  Widget myCollectionList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        addCollection(context),
      ],
    );
  }

  Widget addCollection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 72,
      child: Row(
        children: [
          Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCollectionPage(
                              user: widget.user,
                              product: widget.product,
                            )));
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: primary),
                ),
                child: Center(
                  child: ImageIcon(
                    AssetImage(add_idle),
                    color: Colors.black,
                    size: 12,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('컬렉션 새로 만들기'),
          ),
        ],
      ),
    );
  }

  Widget collectionItems(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('collections')
          .where('userID', isEqualTo: widget.user.username)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return collectionItemBuilder(context, snapshot.data.documents);
      },
    );
  }

  Widget collectionItemBuilder(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collections =
        snapshot.map((e) => Collection.fromSnapshot(e)).toList();
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          return collectionItem(context, collections[index]);
        });
  }

  Widget collectionItem(BuildContext context, Collection collection) {
    return Material(
      child: InkWell(
        onTap: () {
          Firestore.instance
              .collection('collections')
              .document(collection.userID + '+' + collection.title)
              .updateData({
            "products": FieldValue.arrayUnion(
                [widget.product.userID + '+' + widget.product.title]),
          }).then((value) {
            Firestore.instance
                .collection('products')
                .document(widget.product.userID + '+' + widget.product.title)
                .updateData({
            "collections": FieldValue.arrayUnion(
            [collection.userID + '+' + collection.title]),}).then((value) {
              try {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        content: Text(
                            '\'' + collection.title + '\'' + '컬렉션에 추가되었습니다!'),
                      );
                    });

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BootPage(
                          user: widget.user,
                        )),
                        (route) => false);
              } catch (e) {
                print(e.message);
              }
            });
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 72,
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                child: Image(
                  image: FirebaseImage(collection.imageURI,
                      shouldCache: true,
                      maxSizeBytes: 20 * 1024 * 1024,
                      cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(collection.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
