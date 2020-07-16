import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/selection.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/message/chatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  User user;
  Product product;

  ProductDetailPage({this.user, this.product});

  @override
  Widget build(BuildContext context) {
    print(user.username);
    return Scaffold(
      appBar: appBarDefaultDeep(context, '상품 상세'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //getUserInfo(context),
          carousel(context),
          productInfo(context),
          productInfo2(context),
          productScroll(context),
          productScroll(context),
          borderLineGreyLite(context),
          actionButtons(context, user),
        ],
      ),
    );
  }

  Widget getUserInfo(BuildContext context) {
    Firestore.instance.collection('users').document(product.userID).get().then((e) {
      User user = User.getUserData(e);
      return userMarquee2(context, user);
    });
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  product.size == '' ? Container() : Text('사이즈: ' + product.size),
                  product.material == '' ? Container() : Text('소재: ' + product.material),
                  product.color.length == 0 ? Container() : Text('색상: '),
                  product.state == '' ? Container() : Text('상태: '),
                  hSpacer(15)
                ],
              ),
              product.state == '' ? Container() : ShortStateSlider(double.parse(product.state)),
            ],
          ),
          hSpacer(20),
          Text(
              product.description),
          tagList(context),
        ],
      ),
    );
  }

  Widget tagList(BuildContext context) {
    if(product.tags.length == 0)
      return Text("등록된 태그가 없습니다.");

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.tags.length,
        itemBuilder: (context, index) {
          return tagItem(context, product.tags[index]);
        },
      ),
    );
  }

  Widget tagItem(BuildContext context, String tag) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        '#' + tag,
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

  Widget actionButtons(BuildContext context, User user) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getTalk(context, user),
          shortButton(context),
        ],
      ),
    );
  }

  Widget getTalk(BuildContext context, User user) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(user: user,)));
        },
        child: Container(
        width: MediaQuery.of(context).size.width * (163 / 375),
        height: 44,
        decoration:
        BoxDecoration(border: Border.all(color: Colors.black), color: offWhite),
        child: Center(
          child: Text(
            '대화하기',
            style: cta(primary),
          ),
        ),
      ),),
    );
  }

  Widget shortButton(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          color: primary,
          child: Center(
            child: Text('구매하기', style: cta(offWhite),),
          ),
        ),
      ),
    );
  }
}
