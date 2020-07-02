import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/pages/product/productDetailPage.dart';
import 'package:editsource/pages/profile/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/designs/icons.dart';

Widget userMarqueePopularSeller(BuildContext context, User _user) {
  const double _r = 64;
  const double _space = 8;

  return Container(
    margin: EdgeInsets.only(right: 8),
    child: Column(
      children: <Widget>[
        profileImage(_user, _r),
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
    margin: EdgeInsets.only(right: 20, left: 20, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(_user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('_user.bio'),
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
                    Text(_user.getMyProducts().toString()),
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
        Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
            child: ImageIcon(
              AssetImage(edit_idle),
            ),
          ),
        )
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
        profileImage(_user, _r),
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
              profileImage(_user, _r),
              wSpacer(_space1),
              Text(_user.username),
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
              Text(_user.getRate().toString()),
              wSpacer(_space3),
              Text('(' + _user.getReviews().toString() + ' Reviews' + ')'),
            ],
          )
        ],
      ));
}

Widget userMarqueeMessageListItem(
    BuildContext context, User _user, Widget _nav) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;
  const double _space3 = 13;

  const double _iSize = 52;

  return Material(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => _nav));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                profileImage(_user, _r),
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
              width: _iSize,
              height: _iSize,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    ),
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
            profileImage(_user, _r),
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
            profileImage(_user, _r),
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
          profileImage(_user, 48),
          wSpacer(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_user.username),
              Row(
                children: [
                  Text(_review.rate.toString()),
                  wSpacer(8),
                  Text(_review.updatedDate),
                ],
              )
            ],
          )
        ],
      ),
      hSpacer(20),
      Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(_review.productID)));
          },
          child: Text(_review.productID.title),
        ),
      ),
      hSpacer(8),
      Text(_review.comment),
    ],
  );
}

Widget profileImage(User _user, double _r) {
  return Container(
    width: _r,
    height: _r,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.grey),
    child: Center(
        child: Image.asset(
      _user.imageURI,
      fit: BoxFit.cover,
    )),
  );
}
