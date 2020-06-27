import 'dart:html';

import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/designs/typos.dart';
import 'package:flutter/material.dart';

// Buttons
Container primaryCTAIdle(BuildContext context, String textContext) {
  return Container(
    width: 335,
    height: 44,
    decoration:
        BoxDecoration(border: Border.all(color: primary), color: primary),
    child: Center(
      child: Text(
        textContext,
        style: CTA(offWhite),
      ),
    ),
  );
}

Container primaryCTADisabled(BuildContext context, String textContext) {
  return Container(
    width: 335,
    height: 44,
    decoration: BoxDecoration(border: Border.all(color: light), color: light),
    child: Center(
      child: Text(
        textContext,
        style: CTA(offWhite),
      ),
    ),
  );
}

Container secondaryCTAIdle(BuildContext context, String textContext) {
  return Container(
    width: 335,
    height: 44,
    decoration:
        BoxDecoration(border: Border.all(color: primary), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: CTA(primary),
      ),
    ),
  );
}

Container secondaryCTADisabled(BuildContext context, String textContext) {
  return Container(
    width: 335,
    height: 44,
    decoration:
        BoxDecoration(border: Border.all(color: light), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: CTA(light),
      ),
    ),
  );
}

Container action1Idle(BuildContext context, String textContext) {
  return Container(
    width: 137,
    height: 36,
    decoration: BoxDecoration(border: Border.all(color: light), color: light),
    child: Center(
      child: Text(
        textContext,
        style: action1(offWhite),
      ),
    ),
  );
}

Container action1Disabled(BuildContext context, String textContext) {
  return Container(
    width: 137,
    height: 36,
    decoration: BoxDecoration(border: Border.all(color: light), color: light),
    child: Center(
      child: Text(
        textContext,
        style: action1(offWhite),
      ),
    ),
  );
}

Container action2Idle(BuildContext context, String textContext) {
  return Container(
    width: 54,
    height: 24,
    decoration:
        BoxDecoration(border: Border.all(color: primary), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: action2(primary),
      ),
    )
  );
}

Container action2Disabled(BuildContext context, String textContext) {
  return Container(
    width: 54,
    height: 24,
    decoration:
        BoxDecoration(border: Border.all(color: light), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: action2(primary),
      ),
    ),
  );
}

Container FAB1Idle(BuildContext context, String textContext) {
  return Container(
    width: 74,
    height: 74,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: light),
        color: light),
    child: Center(
      child: Text(
        textContext,
        style: text1(primary),
      ),
    ),
  );
}

Container FAB1Disabled(BuildContext context, String textContext) {
  return Container(
    width: 74,
    height: 74,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: light),
        color: light),
    child: Center(
      child: Text(
        textContext,
        style: text1(offWhite),
      ),
    ),
  );
}

Container FAB2Idle(BuildContext context, String textContext) {
  return Container(
    width: 57,
    height: 57,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Color.fromRGBO(252, 74, 3, 1)),
        color: Color.fromRGBO(252, 74, 3, 1)),
    child: Center(
      child: Text(
        textContext,
        style: text1(offWhite),
      ),
    ),
  );
}

Container FAB2Disabled(BuildContext context, String textContext) {
  return Container(
    width: 57,
    height: 57,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: light),
        color: light),
    child: Center(
      child: Text(
        textContext,
        style: text1(offWhite),
      ),
    ),
  );
}
