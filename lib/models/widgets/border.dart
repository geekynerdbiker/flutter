import 'package:flutter/material.dart';

Widget borderLineGreyLite(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 0.5,
    color: Colors.grey,
  );
}

Widget borderLineGrey(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    color: Colors.grey,
  );
}

Widget borderLineGreyBold(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 2,
    color: Colors.grey,
  );
}

Widget borderLineBlackLite(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 0.5,
    color: Colors.black,
  );
}

Widget borderLineBlack(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    color: Colors.black,
  );
}

Widget borderLineBlackBold(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 2,
    color: Colors.black,
  );
}

Widget wSpacer(double _space) {
  return Container(
    width: _space,
  );
}

Widget hSpacer(double _space) {
  return Container(
    height: _space,
  );
}