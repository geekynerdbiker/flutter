import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:artpia/assets/config.dart';
import 'package:artpia/pages/interface.dart';
import 'package:artpia/pages/auth/authentic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return ArtpiaApp();
        return Container();
      },
    );
  }
}

class ArtpiaApp extends StatefulWidget {
  _ArtpiaAppState createState() => _ArtpiaAppState();
}

class _ArtpiaAppState extends State<ArtpiaApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('LOGO', style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
