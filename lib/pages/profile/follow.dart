import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/components/user.dart';
import 'package:flutter/material.dart';

class FollowingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'Following'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                userMarqueeFollow(context, new User('username', '1', 'imageURI')),
          ),
        ],
      ),
    );
  }
}

class FollowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'Follower'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                userMarqueeFollow(context, new User('username', '1', 'imageURI')),
          ),
        ],
      ),
    );
  }
}
