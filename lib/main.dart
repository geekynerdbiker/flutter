import 'package:flutter/material.dart';

import 'package:newnew/pages/forYou/userCollectionPage.dart';
import 'package:newnew/pages/etc/popularSeller.dart';
import 'package:newnew/pages/product/addProductPage.dart';

import 'package:newnew/pages/product/productListPage.dart';
import 'package:newnew/pages/category/mainPage.dart';
import 'package:newnew/pages/start/splashScreen.dart';


import 'pages/home/mainPage.dart';
import 'pages/forYou/mainPage.dart';
import 'pages/profile/mainPage.dart';
import 'pages/product/productListPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

