import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class SelectionSwitch extends StatefulWidget {
  @override
  _SelectionSwitch createState() => _SelectionSwitch();
}

class _SelectionSwitch extends State<SelectionSwitch> {
    bool isSwitched = true;

    @override
    Widget build(BuildContext context){
    return  Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: primary,
      activeColor: semiLight,
    );
  }
}