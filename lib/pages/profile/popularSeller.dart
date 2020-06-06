import 'package:flutter/material.dart';
import 'package:newnew/widgets/etc/popularSeller.dart';

class PopularSellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Text(
            '인기 셀러',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: PopularSeller(),
      ),
    );
  }
}
