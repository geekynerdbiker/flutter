import 'package:editsource/models/classes/user.dart';
import 'package:flutter/material.dart';

Widget messageListItem(BuildContext context, User user) {
  const double _r = 48;
  const double _space = 12;

  const double _tSpace1 = 8;
  const double _tSpace2 = 13;

  const double _iSize = 52;
  const double _iSpace = 20;

  return Container(
      height: MediaQuery.of(context).size.width * (84 / 375),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 20,
              ),
              Container(
                width: _r,
                height: _r,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(user.username),

                      Container(width: _tSpace1),
                     Text(user.lastActivity.toString() + '전'),
                    ],
                  ),
                  Container(
                    height: _tSpace2,
                  ),
                  Text('Message Text'),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: _iSpace),
            child: Container(
              width: _iSize,
              height: _iSize,
              color: Colors.grey,
            ),
          )
        ],
      ));
}
