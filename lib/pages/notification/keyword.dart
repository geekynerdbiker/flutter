import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPage createState() => _KeywordPage();
}

class _KeywordPage extends State<KeywordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: ListView(
        children: [
          keywordNotificationListItem(),
          keywordNotificationListItem(),
          keywordNotificationListItem(),
        ],
      ),
    );
  }
}
