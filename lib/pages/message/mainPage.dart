import 'package:bak/models/components/cards.dart';
import 'package:bak/models/components/user.dart';
import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/message/chatRoom.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final User user;
  MessagePage({this.user});

  @override
  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      appBar: appBarDefault(context, 'Messages'),
      body: ListView(
        children: [
          userMarqueeMessageListItem(context, widget.user),
        ],
      ),
    );
  }
}
