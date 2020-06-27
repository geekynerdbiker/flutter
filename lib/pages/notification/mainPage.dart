import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:editsource/pages/notification/activity.dart';
import 'package:editsource/pages/notification/keyword.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPage createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> with SingleTickerProviderStateMixin {
  TabController _controller;

  List<Tab> _tabs = [
    Tab(
      icon: Text('활동 알림'),
    ),
    Tab(
      icon: Text('키워드 알림'),
    ),
  ];

  List<Widget> pages = [
    ActivityPage(),
    KeywordPage(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarWithTabDeep(context, '알림', _tabs, _controller),
          body: TabBarView(
            controller: _controller,
            children: pages,
          ),
        ),
      ),
    );
  }
}