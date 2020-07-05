import 'package:editsource/pages/home/bootPage.dart';
import 'package:editsource/pages/home/splashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const start = '/';
const mainPage = '/mainPage';

final routes = <String, WidgetBuilder> {
  start: (BuildContext context) => SplashScreen(),
  mainPage: (BuildContext context) => BootPage(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: start,
      routes: routes,
    );
  }
}