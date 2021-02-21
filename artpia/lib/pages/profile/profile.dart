import 'package:flutter/material.dart';

import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/profile/modules.dart';

class ProfilePage extends StatefulWidget {
  UserClass user;

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            // userProfile(context),
            // productList(context),
          ],
        ),
      ),
    );
  }
}
