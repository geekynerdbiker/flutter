import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mzone/page/common/splash.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: _initialization,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done)
          return MZoneApp();
    //     return Container();
    //   },
    // );
  }
}

class MZoneApp extends StatefulWidget {
  _MZoneAppState createState() => _MZoneAppState();
}

class _MZoneAppState extends State<MZoneApp> {
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