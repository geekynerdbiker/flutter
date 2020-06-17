import 'package:flutter/material.dart';
import 'package:newnew/models/const/textSystem.dart';
import 'package:newnew/widgets/forYou/recommends.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Collections', style: mainTitle,),
                Text('see more', style: moreButton,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Shops', style: mainTitle,),
                Text('see more', style: moreButton,),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Products', style: mainTitle,),
                Text('see all', style: moreButton,),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height ,
            child: Recommends(),
          ),
        ],
      ),
    );
  }
}