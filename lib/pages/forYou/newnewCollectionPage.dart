import 'package:flutter/material.dart';
import 'package:newnew/widgets/forYou/userCollections.dart';

class NewnewCollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('기획전', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        leading: BackButton(
          color: Colors.black
        ),
        actions: <Widget>[],
      ),
      backgroundColor: Colors.white,
      body: UserCollections(),
    );
  }
}
