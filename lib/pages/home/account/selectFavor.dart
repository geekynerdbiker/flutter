import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/pages/home/account/selectFavor2.dart';
import 'package:flutter/material.dart';

class SelectFavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSkip(context, '취향 선택', SelectFavorPage2()),
      backgroundColor: offWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            basicNavigationButton(context, '다음 단계', SelectFavorPage2()),
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
