import 'package:editsource/models/UI/cards.dart';
import 'package:editsource/models/widgets/border.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:flutter/material.dart';

class KeywordPage extends StatefulWidget {
  @override
  _KeywordPage createState() => _KeywordPage();
}

class _KeywordPage extends State<KeywordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
