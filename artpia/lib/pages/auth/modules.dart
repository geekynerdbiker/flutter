import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  bool isObsecure = true;

  CustomTextField(
      {Key key, this.controller, this.hintText, this.isObsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusColor: Colors.blue,
          hintText: hintText,
        ),
      ),
    );
  }
}
