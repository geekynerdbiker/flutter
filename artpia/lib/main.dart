import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:artpia/assets/config.dart';
import 'package:artpia/pages/interface.dart';
import 'package:artpia/pages/auth/authentic.dart';

/*
* Appbar : height * 0.05
* BottomNavigationBar : height * 0.1
* Page : height * 0.79
* */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ArtpiaApp());
}

class ArtpiaApp extends StatefulWidget {
  _ArtpiaAppState createState() => _ArtpiaAppState();
}

class _ArtpiaAppState extends State<ArtpiaApp> {
  bool _initialized = false;
  bool _error = false;

  void initialize() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) return SomethingWentWrong();
    if (!_initialized) return Loading();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Something Went Wrong!'),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
    displaySplash();
  }

  getUserInfo() async {
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
        Route route = MaterialPageRoute(builder: (context) => AuthenticPage());
        Navigator.pushReplacement(context, route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            child: Image.asset(
              'lib/assets/logo_path',
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
