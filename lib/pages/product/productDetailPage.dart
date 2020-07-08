import 'package:bak/database/initialize.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '상품 상세'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          getUserInfo(context),
          carousel(context),
          productInfo(context),
          productInfo2(context),
          productScroll(context),
          productScroll(context),
          borderLineGreyLite(context),
          actionButtons(context),
        ],
      ),
    );
  }

  Widget getUserInfo(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return findOwner(context, snapshot.data.documents, product.userID);
      },
    );
  }

  Widget findOwner(
      BuildContext context, List<DocumentSnapshot> snapshot, String userID) {
    List<User> users = snapshot.map((e) => User.fromSnapshot(e)).toList();
    User owner;

    for (int i = 0; i < users.length; i++)
      if (users[i].username == userID) owner = users[i];

    return userMarquee2(context, owner);
  }

  Widget carousel(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (375 / 375),
          height: MediaQuery.of(context).size.width * (360 / 375),
          color: Colors.grey,
          child: Image(
            image: FirebaseImage(product.imageURI[0],
                shouldCache: true,
                maxSizeBytes: 3 * 1024 * 1024,
                cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (360 / 375) - 30),
          child: Center(
            child: imageCarouselIndicator(0, 5),
          ),
        ),
      ],
    );
  }

  Widget productInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(product.price.toString()),
              wSpacer(9),
              Text(product.updateDate),
            ],
          ),
          hSpacer(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.deliveryFee.toString()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ImageIcon(AssetImage(favorite_idle)),
                      Text('111')
                    ],
                  ),
                  wSpacer(20),
                  Column(
                    children: [ImageIcon(AssetImage(save_idle)), Text('111')],
                  ),
                  wSpacer(20),
                  ImageIcon(AssetImage(share_idle)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productInfo2(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('사이즈: ' + 'Item Size'),
                  Text('소재: ' + 'Item Material'),
                  Text('색상: ' + 'Item Color'),
                  Text('상태: ' + 'Item State'),
                  hSpacer(15)
                ],
              ),
              ShortStateSlider(4),
            ],
          ),
          hSpacer(20),
          Text(
              'User Item Description. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'),
          tagList(context),
        ],
      ),
    );
  }

  Widget tagList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          tagItem(context),
          tagItem(context),
          tagItem(context),
        ],
      ),
    );
  }

  Widget tagItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        '#' + 'ItemTag',
        style: TextStyle(color: semiDark),
      ),
    );
  }

  Widget productScroll(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Text('Section title'),
              ImageIcon(AssetImage(forward_idle)),
            ],
          ),
        ),
        productList(context),
      ],
    );
  }

  Widget productList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      child: ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8),
            //child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            //child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            //child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            //child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
        ],
      ),
    );
  }

  Widget actionButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          shortButton(context, offWhite, true, Text('대화하기')),
          shortButton(
              context,
              primary,
              true,
              Text(
                '구매하기',
                style: TextStyle(color: offWhite),
              )),
        ],
      ),
    );
  }
}
