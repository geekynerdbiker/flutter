import 'package:flutter/material.dart';
import 'package:editsource/models/classes/user.dart';

Widget popularSeller(BuildContext context, User user) {
  const double _r = 64;
  const double _space = 8;

  const double _tHeight = 15;

  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: _r,
          height: _r,
          color: Colors.grey,
          child: Center(
              child: Image.asset(
                user.imageURI,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          height: _space,
        ),
        Container(
            width: _r,
            height: _tHeight,
            child: Center(
              child: Text(user.username),
            ))
      ],
    ),
  );
}

Widget userMarqueeMyPage(BuildContext context, User user) {
  const double _r = 48;
  const double _space = 12;

  const double _tWidth = 100;
  const double _tHeight = 15;
  const double _tSpace = 12;

  const double _bWidth = 58;
  const double _bHeight = 15;

  const double _iSize1 = 11;
  const double _iSize2 = 24;
  const double _iSpace1 = 4;
  const double _iSpace2 = 12;

  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: _r,
          height: _r,
          color: Colors.grey,
          child: Center(
              child: Image.asset(
                user.imageURI,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          width: _space,
        ),
        Column(
          children: [
            Container(
                width: _tWidth,
                height: _tHeight,
                child: Center(
                  child: Text(user.bio),
                )),
            Container(height: _tSpace),
            Row(
              children: [
                Container(
                    width: _iSize1,
                    height: _iSize1,
                    child: Center(
                        child: Icon(Icons.watch_later)
                    )),
                Container(
                  width: _iSpace1,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text(user.lastActivity.toString()),
                    )),
                Container(
                  width: _iSpace2,
                ),
                Container(
                    width: _iSize1,
                    height: _iSize1,
                    child: Center(
                        child: Icon(Icons.label)
                    )),
                Container(
                  width: _iSpace1,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text(user.myProducts.toString()),
                    )),
                Container(
                  width: _iSpace2,
                ),
                Container(
                    width: _iSize1,
                    height: _iSize1,
                    child: Center(
                        child: Icon(Icons.directions_car)
                    )),
                Container(
                  width: _iSpace1,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text('Delivery'),
                    )),
              ],
            )
          ],
        ),
        Container(
          width: _iSize2,
          height: _iSize2,
          child: Icon(Icons.edit),
        )
      ],
    ),
  );
}


Widget userMarquee1(BuildContext context, User user) {
  const double _r = 48;
  const double _space = 12;

  const double _tWidth = 100;
  const double _tHeight = 15;
  const double _tSpace = 8;

  const double _bWidth = 32;
  const double _bHeight = 15;
  const double _bSpace1 = 4;
  const double _bSpace2 = 16;

  return Container(
    child: Row(
      children: <Widget>[
        Container(
          width: _r,
          height: _r,
          color: Colors.grey,
          child: Center(
              child: Image.asset(
                user.imageURI,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          width: _space,
        ),
        Column(
          children: [
            Container(
                width: _tWidth,
                height: _tHeight,
                child: Center(
                  child: Text(user.username),
                )),
            Container(height: _tSpace),
            Row(
              children: [
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text('아이템'),
                    )),
                Container(
                  width: _bSpace1,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text(user.myProducts.length.toString()),
                    )),
                Container(
                  width: _bSpace2,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text('팔로워'),
                    )),
                Container(
                  width: _bSpace1,
                ),
                Container(
                    width: _bWidth,
                    height: _bHeight,
                    child: Center(
                      child: Text(user.followers.length.toString()),
                    )),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget userMarquee2(BuildContext context, User user) {
  const double _width = 375;
  const double _height = 40;

  const double _r = 40;
  const double _space = 20;

  const double _tWidth = 140;
  const double _tHeight = 21;
  const double _tSpace = 12;

  const double _bWidth1 = 20;
  const double _bWidth2 = 90;
  const double _bHeight = 17;
  const double _bSpace1 = 4;
  const double _bSpace2 = 8;

  const double _iSize = 4;

  return Container(
    width: _width,
    height: _height,
    child: Row(
      children: <Widget>[
        Container(width: _space,),
        Container(
          width: _r,
          height: _r,
          color: Colors.grey,
          child: Center(
              child: Image.asset(
                user.imageURI,
                fit: BoxFit.cover,
              )),
        ),
        Container(
          width: _tSpace,
        ),
        Container(
            width: _tWidth,
            height: _tHeight,
            child: Center(
              child: Text(user.username),
            )),
        Container(height: _tSpace),
        Container(
            width: _iSize,
            height: _iSize,
            child: Center(
              child: Icon(Icons.star_border)
            )),
        Container(
          width: _bSpace1,
        ),
        Container(
            width: _bWidth1,
            height: _bHeight,
            child: Center(
              child: Text(user.getRate().toString()),
            )),
        Container(
          width: _bSpace2,
        ),
        Container(
            width: _bWidth2,
            height: _bHeight,
            child: Center(
              child: Text('(' + user.getReviews().toString() + ')' + ' Reviews'),
            )),
      ],
    )
  );
}
