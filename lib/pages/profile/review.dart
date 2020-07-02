import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/components/user.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'Review'),
      body: ListView(
        children: [
          reviewItem(context),
        ],
      ),
    );
  }

  Widget reviewItem(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: userMarqueeRiview(context, new User('username', 1, 'imageURI'), new Review('comment', 'updatedDate',  new Product('title', 1, 'imageURItest'))),
        ),
        borderLineGreyLite(context),
      ],
    );
  }
}
