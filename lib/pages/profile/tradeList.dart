import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:flutter/material.dart';

class TradeListPage extends StatefulWidget {
  _TradeListPage createState() => _TradeListPage();
}

class _TradeListPage extends State<TradeListPage> with TickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('구매'),
    ),
    Tab(icon: Text('판매')),
  ];

  List<Widget> _pages = [
    BuyingListPage(),
    SellingListPage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWithTabDeep(context, '구매/판매 내역', _tabs, _controller),
        body: TabBarView(controller: _controller, children: _pages));
  }
}

class BuyingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        productItem1(context, new Product('title', 1, '/')),
      ],
    );
  }
}

class SellingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        productItem1(context, new Product('title', 1, '/')),
      ],
    );
  }
}
