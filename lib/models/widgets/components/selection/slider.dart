import 'package:flutter/material.dart';

class Slider extends StatefulWidget {
  final double minimum, maximum;

  @override
  Slider({this.minimum, this.maximum});

  _Slider createState() => _Slider();
}

class _Slider extends State<Slider> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    RangeValues values = RangeValues(widget.minimum, widget.maximum);
    RangeLabels labes = RangeLabels(
        widget.minimum.toString(), widget.maximum.toString());

    return RangeSlider(
        min: widget.minimum,
        max: widget.maximum,
        values: values,
        labels: labes,
        divisions: ((widget.maximum - widget.minimum) ~/ 1000),
        onChanged: (value) {
          setState(() {
            values = value;
            labes = RangeLabels(
                value.start.toInt().toString(), value.end.toInt().toString());
          });
        }
    );
  }
}