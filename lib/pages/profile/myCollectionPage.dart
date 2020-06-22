import 'package:flutter/material.dart';

class MyCollectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 4 / 5,
        child: FloatingActionButton.extended(
            label: Text(
              "새 컬렉션 추가하기",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: Colors.black,
            onPressed: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      body: Container(),//MyCollections(),
    );
  }
}
