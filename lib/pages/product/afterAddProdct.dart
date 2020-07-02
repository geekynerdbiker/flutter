import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class AfterAddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(context, ''),
      body: Column(

        children: [
          hSpacer(64),
          Text('상품이 등록되었습니다!'),
          hSpacer(28),
          Text('이 상품 다 곳에 공유하면 더 빨리,'),
          Text('더 잘팔려요. 공유하시겠습니까?'),
          hSpacer(28),
          mediumButton(context, Colors.green, false, Text('네이버 블로그에 공유')),
          hSpacer(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              shareContainer(context, Colors.blue),
              wSpacer(12),
              shareContainer(context, Colors.grey),
              wSpacer(12),
              shareContainer(context, Colors.yellow),
            ],
          ),
          hSpacer(135),
          Text('다른 물건도 등록해보세요!'),
          hSpacer(28),
          longButtonPop(context, primary, false, Text('다른 상품 등록하기', style: TextStyle(color: offWhite),)),
        ],
      ),
    );
  }

  Widget shareContainer(BuildContext context, Color _colors) {
    return Container(
      width: 64,
      height: 64,
      color: _colors,
    );
  }
}
