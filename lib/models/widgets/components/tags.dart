import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/designs/typos.dart';
import 'package:flutter/material.dart';

// Tags
Container tagIdle(BuildContext context, String textContext) {
  return Container(
    width: 53,
    height: 28,
    decoration:
    BoxDecoration(border: Border.all(color: primary), color: offWhite),
    child: Text(
      textContext,
      textAlign: TextAlign.center,
      style: CTA(primary),
    ),
  );
}

Container tagDisabled(BuildContext context, String textContext) {
  return Container(
    width: 53,
    height: 28,
    decoration: BoxDecoration(border: Border.all(color: light), color: light),
    child: Text(
      textContext,
      textAlign: TextAlign.center,
      style: action1(offWhite),
    ),
  );
}