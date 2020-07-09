import 'dart:async';
import 'package:bak/database/initialize.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:bak/pages/home/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    if (auth.currentUser() == null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BootPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Image.asset(
            'lib/assets/icons/drawable-xxxhdpi/new_new_logo_horizontal.png',
            scale: 0.5,
          ),
        ),
      ),
    );
  }
}
