import 'package:editsource/models/widgets/border.dart';
import 'package:editsource/models/widgets/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:editsource/models/classes/user.dart';

Widget userMarqueePopularSeller(BuildContext context, User user) {
  const double _r = 64;
  const double _space = 8;

  return Container(
    child: Column(
      children: <Widget>[
        profileImage(user, _r),
        hSpacer(_space),
        Text('@' + user.username),
      ],
    ),
  );
}

Widget userMarqueeMyPage(BuildContext context, User user) {
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
            profileImage(user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('user.bio'),
                hSpacer(_space2),
                Row(
                  children: [
                    ImageIcon(AssetImage('lib/assets/icons/drawable-xxxhdpi/12_px_time.png'), size: 12,),
                    wSpacer(_space3),
                    Text(user.lastActivity.toString()),
                    wSpacer(_space4),
                    ImageIcon(AssetImage('lib/assets/icons/drawable-xxxhdpi/12_px_sales.png'), size: 12,),
                    wSpacer(_space3),
                    Text(user.getMyProducts().toString()),
                    wSpacer(_space4),
                    ImageIcon(AssetImage('lib/assets/icons/drawable-xxxhdpi/12_px_quick_delivery.png'), size: 12,),
                    wSpacer(_space3),
                    Text('Delivery'),
                  ],
                )
              ],
            ),
          ],
        ),
        ImageIcon(AssetImage('lib/assets/icons/drawable-xxxhdpi/24_px_edit_idle.png'),),
      ],
    ),
  );
}

Widget userMarquee1(BuildContext context, User user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;
  const double _space3 = 4;
  const double _space4 = 16;

  return Container(
    child: Row(
      children: <Widget>[
        profileImage(user, _r),
        wSpacer(_space1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@' + user.username),
            hSpacer(_space2),
            Row(
              children: [
                Text('아이템'),
                wSpacer(_space3),
                Text(user.myProducts.length.toString()),
                wSpacer(_space4),
                Text('팔로워'),
                wSpacer(_space3),
                Text(user.followers.length.toString()),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget userMarquee2(BuildContext context, User user) {
  const double _r = 40;
  const double _space1 = 12;
  const double _space2 = 4;
  const double _space3 = 8;

  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: [
          profileImage(user, _r),
          wSpacer(_space1),
          Text(user.username),
        ],
      ),
      Row(
        children: [
          Icon(Icons.star_border),
          wSpacer(_space2),
          Text(user.getRate().toString()),
          wSpacer(_space3),
          Text('(' + user.getReviews().toString() + ' Reviews' + ')'),
        ],
      )
    ],
  ));
}

Widget userMarqueeMessageListItem(BuildContext context, User user) {
  const double _r = 48;
  const double _space1 = 12;
  const double _space2 = 8;
  const double _space3 = 13;

  const double _iSize = 52;

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(user, _r),
            wSpacer(_space1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(user.username),
                    wSpacer(_space2),
                    Text(user.lastActivity.toString() + '전'),
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
  );
}

Widget userMarqueeNotificationFollow(BuildContext context, User user) {
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
            profileImage(user, _r),
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

Widget userMarqueeNotificationAction(BuildContext context, User user) {
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
            profileImage(user, _r),
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

Widget profileImage(User user, double _r) {
  return Container(
    width: _r,
    height: _r,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.grey),
    child: Center(
        child: Image.asset(
      user.imageURI,
      fit: BoxFit.cover,
    )),
  );
}
