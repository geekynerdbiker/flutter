import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:artpia/assets/config.dart';
import 'package:artpia/pages/interface.dart';
import 'package:artpia/pages/auth/signin.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUserDetail();
    displaySplash();
  }

  getUserDetail() async {
    Artpia.auth = FirebaseAuth.instance;
    Artpia.sharedPreferences = await SharedPreferences.getInstance();
    Artpia.firestore = FirebaseFirestore.instance;
  }

  displaySplash() {
    Timer(new Duration(seconds: 3), () async {
      if (await Artpia.auth.currentUser != null) {
        Route route = MaterialPageRoute(builder: (context) => InterfacePage());
        Navigator.pushReplacement(context, route);
      } else {
        Route route = MaterialPageRoute(builder: (context) => SignInPage());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('LOGO', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
