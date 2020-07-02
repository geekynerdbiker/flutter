import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/home/bootPage.dart';
import 'package:editsource/pages/home/homePage.dart';
import 'package:flutter/material.dart';

class SelectFavorPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSkip(context, '취향 선택', BootPage()),
      backgroundColor: offWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            basicNavigationButton(context, '완료', BootPage()),
          ],
        ),
      ),
    );
  }

  Widget basicNavigationButton(
      BuildContext context, String _textContext, Widget _route) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _route));
        },
        child: Container(
          height: 44,
          width: MediaQuery.of(context).size.width * (335 / 375),
          color: Colors.black,
          child: Center(
            child: Text(
              _textContext,
              style: TextStyle(fontSize: 14, color: offWhite),
            ),
          ),
        ),
      ),
    );
  }
}
