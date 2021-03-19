import 'package:artpia/pages/setting/module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppBar(context),
      backgroundColor: Colors.white,
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          list(context, 'list1'),
          list(context, 'list2'),
        ],
      ),
    );
  }

  Widget list(BuildContext context, String s) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, ),
      child: Column(
        children: [
          listItemTitle(context, 'Title'),
          listItem(context, 'test1'),
          listItem(context, 'test2'),
          listItem(context, 'test3'),
        ],
      ),
    );
  }

  Widget listItemTitle(BuildContext context, String option) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        option,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget listItem(BuildContext context, String option) {
    return InkWell(
      onTap: () => print('selected ' + option),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              option,
              // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(CupertinoIcons.right_chevron)
        ],
      ),
    );
  }
}
