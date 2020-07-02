import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/message/chat.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
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
          userMarqueeMessageListItem(context, new User('121', 5, '/'), ChatRoomPage(new User('121', 2, 'imageURI'))),
          borderLineGreyLite(context),
          userMarqueeMessageListItem(context, new User('11221', 5, '/'), ChatRoomPage(new User('11221', 2, 'imageURI'))),
          borderLineGreyLite(context),
          userMarqueeMessageListItem(context, new User('1ss21', 5, '/'), ChatRoomPage(new User('1ss21', 2, 'imageURI'))),
          borderLineGreyLite(context),
        ],
      ),
    );
  }
}
