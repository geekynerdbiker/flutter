import 'package:editsource/models/UI/user.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/widgets/border.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPage createState() => _ActivityPage();
}

class _ActivityPage extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          userMarqueeNotificationAction(context, new User('username', 111, 'imageURI')),
          userMarqueeNotificationFollow(context, new User('username', 111, 'imageURI')),
          userMarqueeNotificationAction(context, new User('username', 111, 'imageURI')),
          userMarqueeNotificationFollow(context, new User('username', 111, 'imageURI')),
          userMarqueeNotificationFollow(context, new User('username', 111, 'imageURI')),
          userMarqueeNotificationAction(context, new User('username', 111, 'imageURI')),
        ],
      ),
    );
  }
}