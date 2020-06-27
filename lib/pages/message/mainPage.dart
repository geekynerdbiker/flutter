import 'package:editsource/models/UI/message.dart';
import 'package:editsource/models/UI/user.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/widgets/border.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarDefault(context, 'Messages'),
          body: ListView(
            children: [
              userMarqueePopularSeller(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),
              userMarquee1(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),
              userMarquee2(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),
              userMarqueeMyPage(context, new User('User1', 5, '/')),
              userMarqueeMessageListItem(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),

            ],
          )),
    );
  }
}
