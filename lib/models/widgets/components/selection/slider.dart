import 'package:editsource/models/designs/colors.dart';
import 'package:flutter/material.dart';

class StateSlider extends StatefulWidget {
  _StateSlider createState() => _StateSlider();
}

class _StateSlider extends State<StateSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: primary,
        activeTickMarkColor: primary,
        inactiveTrackColor: semiDark,
        inactiveTickMarkColor: semiDark,
        thumbColor: primary,
        overlayColor: Colors.transparent
      ),
      child: Slider(
          min: 0,
          max: 10,
          value: _value,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          }),
    );
  }
}
