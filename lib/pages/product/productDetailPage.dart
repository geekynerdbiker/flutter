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
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/collection/collectionList.dart';
import 'package:bak/pages/message/chatRoom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  User user;
  User owner;
  Product product;

  ProductDetailPage({this.user, this.product, this.owner});

  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  int currentIndex = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < widget.user.favorite.length; i++)
      if (widget.user.favorite[i] ==
          widget.product.userID + '+' + widget.product.title) isLiked = true;

    return Scaffold(
      appBar: appBarDefaultDeep(context, '상품 상세'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          userMarquee2(context, widget.owner),
          carousel(context),
          productInfo(context),
          productInfo2(context),
          productScroll(context),
          productScroll(context),
          borderLineGreyLite(context),
          actionButtons(context, widget.user),
        ],
      ),
    );
  }

  Widget carousel(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.product.imageURI
              .map((item) => Container(
                    child: Image(
                      image: FirebaseImage(item,
                          shouldCache: true,
                          maxSizeBytes: 20 * 1024 * 1024,
                          cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.green,
                  ))
              .toList(),
          options: CarouselOptions(
              height: MediaQuery.of(context).size.width * (360 / 375),
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (360 / 375) - 45),
          child: Center(
            child: DotsIndicator(
                dotsCount: widget.product.imageURI.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                    shape: CircleBorder(
                        side: BorderSide(color: Color.fromRGBO(255, 52, 0, 1))),
                    color: Colors.transparent,
                    activeColor: Color.fromRGBO(254, 59, 0, 1))),
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
          Text(
            widget.product.title,
            style: body1(primary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.product.price.toString() + '원'),
              wSpacer(9),
              Text(widget.product.updateDate),
            ],
          ),
          hSpacer(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('배송료 ' + widget.product.deliveryFee.toString()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            !isLiked
                                ? Firestore.instance
                                    .collection('users')
                                    .document(widget.user.username)
                                    .updateData({
                                    "favorite": FieldValue.arrayUnion([
                                      widget.product.userID +
                                          '+' +
                                          widget.product.title
                                    ])
                                  }).then((value) {
                                    Firestore.instance
                                        .collection('products')
                                        .document(widget.product.userID +
                                            '+' +
                                            widget.product.title)
                                        .updateData({
                                      "liked": FieldValue.arrayUnion(
                                          [widget.user.username])
                                    });
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  })
                                : Firestore.instance
                                    .collection('users')
                                    .document(widget.user.username)
                                    .updateData({
                                    "favorite": FieldValue.arrayRemove([
                                      widget.product.userID +
                                          '+' +
                                          widget.product.title
                                    ])
                                  }).then((value) {
                                    Firestore.instance
                                        .collection('products')
                                        .document(widget.product.userID +
                                            '+' +
                                            widget.product.title)
                                        .updateData({
                                      "liked": FieldValue.arrayRemove(
                                          [widget.user.username])
                                    });
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                  });

                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Center(
                                child: !isLiked
                                    ? ImageIcon(
                                        AssetImage(favorite_idle_inverse),
                                        color: primary,
                                      )
                                    : ImageIcon(
                                        AssetImage(favorite_active_inverse),
                                        color: primary,
                                      )),
                          ),
                        ),
                      ),
                      Text(widget.product.liked.length.toString()),
                    ],
                  ),
                  wSpacer(20),
                  Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CollectionListPage(
                                          user: widget.user,
                                          product: widget.product,
                                        )));
                          },
                          child: ImageIcon(AssetImage(save_idle)),
                        ),
                      ),
                      Text(widget.product.collections.length.toString())
                    ],
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
                  widget.product.size == ''
                      ? Container()
                      : Text('사이즈: ' + widget.product.size),
                  widget.product.material == ''
                      ? Container()
                      : Text('소재: ' + widget.product.material),
                  widget.product.color.length == 0
                      ? Container()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Text('색상: '),
                              getColors(context),
                            ]),
                  widget.product.state == ''
                      ? Container()
                      : Text('상태: ' + widget.product.state + '/10.0 점'),
                  hSpacer(15)
                ],
              ),
              widget.product.state == ''
                  ? Container()
                  : Container(
                child: ShortStateSlider(double.parse(widget.product.state)),
              )
            ],
          ),
          hSpacer(20),
          Text(widget.product.description),
          tagList(context),
        ],
      ),
    );
  }

  Widget getColors(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: colorList(context),
    );
  }

  List<Widget> colorList(BuildContext context) {
    List<Widget> colors = List<Widget>();
    for (int i = 0; i < widget.product.color.length; i++)
      colors.add(colorCircle(
          context, Color(int.parse(widget.product.color[i], radix: 16))));

    return colors;
  }

  Widget colorCircle(BuildContext context, Color _color) {
    const double _r = 12;
    bool isWhite = _color == Colors.white;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: _r,
      height: _r,
      child: Container(
        width: _r,
        height: _r,
        decoration: !isWhite
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: _color)
            : BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(100),
                color: _color,
              ),
      ),
    );
  }

  Widget tagList(BuildContext context) {
    if (widget.product.tags.length == 0) return Text("등록된 태그가 없습니다.");

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.tags.length,
        itemBuilder: (context, index) {
          return tagItem(context, widget.product.tags[index]);
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
        Container(
          height: 200,
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          child:
              productItemCardSmall(context, productItems[index], widget.user),
        );
      },
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatRoomPage(
                        user: user,
                      )));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: offWhite),
          child: Center(
            child: Text(
              '대화하기',
              style: cta(primary),
            ),
          ),
        ),
      ),
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
            child: Text(
              '구매하기',
              style: cta(offWhite),
            ),
          ),
        ),
      ),
    );
  }
}
