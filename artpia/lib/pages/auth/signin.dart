import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:artpia/pages/interface.dart';

class SignInPage extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialOptions(context),
          ],
        ),
      ),
    );
  }

  Widget socialOptions(BuildContext context) {
    return Column(
      children: [
        button(context, 'Google'),
        button(context, 'Apple'),
        button(context, 'Facebook'),
      ],
    );
  }

  Widget button(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        switch (title) {
          case 'Google':
            google();
            return;
          case 'Apple':
            apple();
            return;
          case 'Facebook':
            facebook();
            return;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: (MediaQuery.of(context).size.width - 100),
        height: 30,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  void google() {
    print('Google Sign In');
    navigateToHome();
  }

  void apple() {
    print('Apple Sign In');
  }

  void facebook() {
    print('Facebook Sign In');
  }

  void navigateToHome() {
    Route route = MaterialPageRoute(builder: (context) => InterfacePage());
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}
