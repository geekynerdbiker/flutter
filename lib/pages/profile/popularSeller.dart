import 'package:flutter/material.dart';
import 'package:newnew/models/widgets/appbar.dart';
import 'package:newnew/widgets/etc/popularSeller.dart';

class PopularSellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '인기 셀러'),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: PopularSeller(),
      ),
    );
  }
}
