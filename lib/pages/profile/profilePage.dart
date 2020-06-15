import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/pages/profile/shopPage.dart';
import 'package:newnew/widgets/profile/myCollections.dart';
import 'package:newnew/pages/profile/myCollectionPage.dart';
import 'package:newnew/widgets/profile/reviews.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage>
    with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('상점'),
    ),
    Tab(
      icon: Text('컬렉션'),
    ),
    Tab(
      icon: Text('리뷰'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarWithTabDeep(context, '프로필', _tabs, _controller),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[
              ShopPage(),
              MyCollectionPage(),
              Reviews(),
            ],
          ),
        ),
      ),
    );
  }
}
