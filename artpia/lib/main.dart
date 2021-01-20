import 'package:flutter/material.dart';
import 'package:artpia/pages/start/splash.dart';

void main() => runApp(Artpia());

class Artpia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
