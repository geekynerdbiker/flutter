import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSetting extends StatelessWidget {
  User user;
  NotificationSetting({this.user});

  bool getNotification = true;
  bool avoidInterrupt = true;

  bool collectionJoin = true;
  bool collectionFollowed = true;
  bool collectionJoinAllowed = true;
  bool collectionJoinDenied = true;

  bool myProductLiked = true;
  bool myProductAdded = true;
  bool wannaBuyMyProduct = true;
  bool favoriteProductDiscounted = true;

  bool reviewAdded = true;
  bool accountFollowed = true;

  bool gotMessage = true;
  bool deliveryStateChanged = true;
  bool deliveried = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '알림 설정'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          defaultNotification(context),
          serviceInfo(context),
          serviceNotification(context),
          productNotification(context),
          shopNotification(context),
          messageNotification(context),
          deliveryNotification(context),
        ],
      ),
    );
  }

  Widget defaultNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("알림 표시"),
                  SelectionSwitch(
                    value: getNotification,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("방해 금지 시간대 설정"),
                  SelectionSwitch(
                    value: avoidInterrupt,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: light,
          child: Text("서비스 정보"),
        ),
        Material(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("키워드 알림"),
                  ImageIcon(AssetImage(forward_idle), size: 12,),
                ],
              ),
            ),
          ),
        ),
        borderLineGreyLite(context),
        Material(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("팔로잉 상점 알림"),
                  ImageIcon(AssetImage(forward_idle), size: 12,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget serviceNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color: light,
              child: Text("서비스 알림"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 컬렉션에 참여 신청이 있을 때"),
                  SelectionSwitch(
                    value: collectionJoin,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 컬렉션에 팔로우 되었을 때"),
                  SelectionSwitch(
                    value: collectionFollowed,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("컬렉션 참여 신청이 승인되었을 때"),
                  SelectionSwitch(
                    value: collectionJoinAllowed,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("컬렉션 참여 신청이 거절되었을 때"),
                  SelectionSwitch(
                    value: collectionJoinDenied,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color: light,
              child: Text("상품 알림"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 상품을 누군가 좋아요했을 때"),
                  SelectionSwitch(
                    value: myProductLiked,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 상품이 컬렉션에 추가되었을 때"),
                  SelectionSwitch(
                    value: myProductAdded,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 상품이 구매 요청되었을 때"),
                  SelectionSwitch(
                    value: wannaBuyMyProduct,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내가 좋아요한 상품의 가격이 떨어졌을 때"),
                  SelectionSwitch(
                    value: favoriteProductDiscounted,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color: light,
              child: Text("상점 알림"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 상점에 리뷰가 등록되었을 때"),
                  SelectionSwitch(
                    value: reviewAdded,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("내 상점을 눅군가 팔로우햇을 때"),
                  SelectionSwitch(
                    value: accountFollowed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color: light,
              child: Text("메세지 알림"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("새로운 메세지가 도착했을 때"),
                  SelectionSwitch(
                    value: gotMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget deliveryNotification(BuildContext context) {
    return Material(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              color: light,
              child: Text("배송 알림"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("배송 진행 상황"),
                  SelectionSwitch(
                    value: deliveryStateChanged,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("배송이 완료되었을 때"),
                  SelectionSwitch(
                    value: deliveried,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionSwitch extends StatefulWidget {
  bool value;

  SelectionSwitch({this.value});

  @override
  _SelectionSwitch createState() => _SelectionSwitch();
}

class _SelectionSwitch extends State<SelectionSwitch> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: primary,
        value: widget.value,
        onChanged: (value) {
          setState(() {
            widget.value = value;
          });
        },
      ),
    );
  }
}
