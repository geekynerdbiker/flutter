import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/product/productDetailPage.dart';
import 'package:bak/pages/product/productList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  User user;
  RecommendPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: collections(context),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: sellers(context),
          ),
          products(context),
        ],
      ),
    );
  }

  Widget collections(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('컬렉션'),
              seeMore(context, accent1, ProductListPage()),
            ],
          ),
        ),
        Container(
          height: 300,
          child: collectionItemList(context),
        )
      ],
    );
  }

  Widget collectionItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('collections').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildCollectionBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildCollectionBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Collection> collectionItems =
        snapshot.map((e) => Collection.fromSnapshot(e)).toList();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: collectionItems.length,
        itemBuilder: (context, index) {
          return collectionCardLarge(context, collectionItems[index], user, primary);
        },
    );
  }

  Widget sellers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('추천 셀러'),
        ),
        Container(
          height: 150,
          margin: EdgeInsets.only(left: 20),
          child: userItemList(context),
        ),
      ],
    );
  }

  Widget userItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildUserBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildUserBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<User> userItems = snapshot.map((e) => User.fromSnapshot(e)).toList();
    return ListView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        children: userItemBuilder(context, userItems),
    );
  }

  List<Widget> userItemBuilder(BuildContext context, List<User> users) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < users.length; i++)
      items.add(userMarqueePopularSeller(context, users[i]));

    return items;
  }

  Widget products(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('추천 상품'),
              seeMore(context, accent1, ProductListPage()),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 5,
          child: productItemList(context),
        ),
      ],
    );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
        snapshot.map((e) => Product.fromSnapshot(e)).toList();
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        children: productItemBuilder(context, productItems),
    );
  }

  List<Widget> productItemBuilder(
      BuildContext context, List<Product> products) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < products.length; i++)
      items.add(productImageBox(context, products[i]));

    return items;
  }

  Widget productImageBox(BuildContext context, Product product) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(user: user,
                        product: product,
                      )));
        },
        child: Container(
          color: Colors.grey,
          child: Image(
            image: FirebaseImage(product.imageURI[0],
                shouldCache: true,
                maxSizeBytes: 20 * 1024 * 1024,
                cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
