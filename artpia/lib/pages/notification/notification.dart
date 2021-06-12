import 'package:flutter/material.dart';

import 'package:artpia/pages/notification/module.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notificationAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context),
            notificationField(context)
          ],
        ),
      ),
    );
  }
}

Widget notificationField(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    height: 20,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              'UserID ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('did something a minute ago!'),
          ],
        ),
      ],
    ),
  );
}
