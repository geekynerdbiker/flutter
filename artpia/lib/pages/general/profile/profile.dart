import 'package:flutter/material.dart';

import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/general/profile/modules.dart';

class ProfilePage extends StatefulWidget {
  User user;

  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: profileAppBar(context),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          // userProfile(context),
          // productList(context),
        ],
      ),
    );
  }
}