import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/pages/home/account/selectFavor2.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:flutter/material.dart';

class SelectFavorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSkip(context, '취향 선택', BootPage()
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * (335 / 375),
        height: 44,
        child: FloatingActionButton.extended(
            heroTag: "confirm1",
            label: Text(
              "다음 단계",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectFavorPage2()));
            }),
      ),
      backgroundColor: offWhite,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}