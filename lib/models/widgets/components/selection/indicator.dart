import 'package:flutter/material.dart';
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
