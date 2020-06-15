import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/widgets/collection/userCollections.dart';

class UserCollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '모든 컬렉션'),
      backgroundColor: Colors.white,
      body: UserCollections(),
    );
  }
}
