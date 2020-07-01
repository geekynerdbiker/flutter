import 'package:flutter/material.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';

DotsIndicator imageCarouselIndicator(int currentIndexPage, int pageLength) {
  return DotsIndicator(
      dotsCount: pageLength,
      position: currentIndexPage.toDouble(),
      decorator: DotsDecorator(
          shape: CircleBorder(side: BorderSide(color: Color.fromRGBO(255, 52, 0, 1))),
          color: Colors.transparent,
          activeColor: Color.fromRGBO(254, 59, 0, 1)));
}

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