import 'dart:io';

import 'package:bak/models/classes/product.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/message/chatRoom.dart';
import 'package:bak/pages/profile/editProfile.dart';
import 'package:bak/pages/profile/sellerPage.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/icons.dart';

Widget userMarqueePopularSeller(BuildContext context, User _user) {
  const double _r = 80;
  const double _space = 8;

  return Container(
    margin: EdgeInsets.only(right: 8),
    child: Column(
      children: <Widget>[
        profileImage(context, _user, _r),
        hSpacer(_space),
        Text('@' + _user.username),
      ],
    ),
  );
}

Widget userMarqueeMyPage(BuildContext context, User _user) {
  const double _r = 64;
  const double _space1 = 12;
  const double _space2 = 12;
  const double _space3 = 4;
  const double _space4 = 12;

  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(context, _user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  child: Text('_user.bio'),
                ),
                hSpacer(_space2),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage(time),
                      size: 12,
                    ),
                    wSpacer(_space3),
                    Text(_user.lastActivity.toString()),
                    wSpacer(_space4),
                    ImageIcon(
                      AssetImage(sales),
                      size: 12,
                    ),
                    wSpacer(_space3),
                    Text(_user.myProducts.length.toString()),
                    wSpacer(_space4),
                    ImageIcon(
                      AssetImage(quick_delivery),
                      size: 12,
                    ),
                    wSpacer(_space3),
                    Text('Delivery'),
                  ],
                )
              ],
            ),
          ],
        ),
        _user.username != 'guest'
            ? Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                                  user: _user,
                                )));
                  },
                  child: ImageIcon(
                    AssetImage(edit_idle),
                  ),
                ),
              )
            : Container()
      ],
    ),
  );
}

Widget userMarquee1(BuildContext context, User _user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;
  const double _space3 = 4;
  const double _space4 = 16;

  return Container(
    child: Row(
      children: <Widget>[
        profileImage(context, _user, _r),
        wSpacer(_space1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@' + _user.username),
            hSpacer(_space2),
            Row(
              children: [
                Text('아이템'),
                wSpacer(_space3),
                Text(_user.myProducts.length.toString()),
                wSpacer(_space4),
                Text('팔로워'),
                wSpacer(_space3),
                Text(_user.followers.length.toString()),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget userMarquee2(BuildContext context, User _user) {
  const double _r = 40;
  const double _space1 = 12;
  const double _space2 = 4;
  const double _space3 = 8;

  return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              profileImage(context, _user, _r),
              wSpacer(_space1),
              Text(
                _user.username,
                style: caption2(primary),
              ),
            ],
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage(
                    'lib/assets/icons/drawable-xxxhdpi/12_px_star_active.png'),
                size: 12,
              ),
              wSpacer(_space2),
              _user.rate == 'null'
                  ? Text(
                      '0.0',
                      style: caption2(primary),
                    )
                  : Text(
                      _user.rate,
                      style: caption2(primary),
                    ),
              wSpacer(_space3),
              Text(
                '(' + _user.reviews.length.toString() + ' Reviews' + ')',
                style: label(primary),
              ),
            ],
          )
        ],
      ));
}

Widget userMarqueeMessageListItem(BuildContext context, User _user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;
  const double _space3 = 13;

  const double _iSize = 52;

  return Material(
    child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatRoomPage(user: _user)));
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      profileImage(context, _user, _r),
                      wSpacer(_space1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(_user.username),
                              wSpacer(_space2),
                              Text(_user.lastActivity.toString() + '전'),
                            ],
                          ),
                          hSpacer(_space3),
                          Text('Message Text'),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    //productImage will be here
                    width: _iSize,
                    height: _iSize,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            borderLineGreyLite(context),
          ],
        )),
  );
}

Widget userMarqueeNotificationFollow(BuildContext context, User _user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 4;

  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(context, _user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('line1'),
                Text('line2'),
                hSpacer(_space2),
                Text('Time'),
              ],
            ),
          ],
        ),
        action2Idle(context, 'action'),
      ],
    ),
  );
}

Widget userMarqueeNotificationAction(BuildContext context, User _user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 4;

  const double _iSize = 52;

  return Container(
    margin: EdgeInsets.only(right: 20, left: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(context, _user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('line1'),
                Text('line2'),
                hSpacer(_space2),
                Text('Time'),
              ],
            ),
          ],
        ),
        Container(
          width: _iSize,
          height: _iSize,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget userMarqueeRiview(BuildContext context, User _user, Review _review) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          profileImage(context, _user, 48),
          wSpacer(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_user.username),
              Row(
                children: [
                  Text(_review.comment),
                  wSpacer(8),
                  Text(_review.updateDate),
                ],
              )
            ],
          )
        ],
      ),
      hSpacer(20),
      Material(
        child: InkWell(
//          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        ProductDetailPage(_review.productID)));
//          },
          child: Text(_review.productID),
        ),
      ),
      hSpacer(8),
      Text(_review.comment),
    ],
  );
}

Widget userMarqueeFollow(BuildContext context, User _user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            profileImage(context, _user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_user.username),
                hSpacer(_space2),
                Row(
                  children: [
                    Text('_user.bio'),
                  ],
                )
              ],
            )
          ],
        ),
        action2Idle(context, '팔로우'),
      ],
    ),
  );
}

Widget profileImage(BuildContext context, User _user, double _r) {
  String path = 'gs://newnew-test.appspot.com/user/' + _user.username +
      '+' + 'profile.jpg';
  var image = FirebaseImage(path, shouldCache: true, maxSizeBytes: 50 * 1024 * 1024, cacheRefreshStrategy: CacheRefreshStrategy.BY_METADATA_DATE);

  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SellerPage(user: _user)));
      },
      child: CircleAvatar (
        backgroundImage: image,
        backgroundColor: Colors.grey,
      )
//      child: Container(
//        width: _r,
//        height: _r,
//        decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(50), color: Colors.grey),
//        child: _user.username == 'guest'
//            ? null
//            : Image(
//                image: FirebaseImage(
//                  _user.imageURI,
//                  shouldCache: true,
//                  maxSizeBytes: 3 * 1000 * 1000,
//                  cacheRefreshStrategy: CacheRefreshStrategy.NEVER,
//                ),
//                fit: BoxFit.cover,
//              ),
//      ),
    ),
  );
}