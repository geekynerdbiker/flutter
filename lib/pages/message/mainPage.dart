import 'package:editsource/models/UI/cards.dart';
import 'package:editsource/models/UI/user.dart';
import 'package:editsource/models/classes/collection.dart';
import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/designs/colors.dart';
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
          backgroundColor: offWhite,
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
              borderLineGreyLite(context),

              userMarqueeMessageListItem(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),

              userMarqueeNotificationFollow(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),

              userMarqueeNotificationAction(context, new User('User1', 5, '/')),
              borderLineGreyLite(context),

              keywordNotificationListItem(),
              borderLineGreyLite(context),

              productItemCardLarge(context, new Product('title', 500, '/')),
              borderLineGreyLite(context),

              productItemCardMedium(context, new Product('title', 500, '/')),
              borderLineGreyLite(context),

              productItemCardSmall(context, new Product('title', 500, '/')),
              borderLineGreyLite(context),

              collectionCoverCard(context, new Collection('title', new User('username', 5, 'imageURI'), '/')),
              borderLineGreyLite(context),
            ],
          )),
    );
  }
}
