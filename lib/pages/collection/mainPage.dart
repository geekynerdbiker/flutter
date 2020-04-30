import 'package:flutter/material.dart';

import 'package:newnew/pages/collection/feed.dart';
import 'package:newnew/widgets/collection/mainPage/collections.dart';
import 'package:newnew/widgets/collection/mainPage/userCollection.dart';

class CollectionPage extends StatefulWidget {
  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> with TickerProviderStateMixin {
  TabController _controller;

  AnimationController _animationControllerOn;
  AnimationController _animationControllerOff;
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;

  int _currentIndex = 0;
  int _prevControllerIndex = 0;
  double _aniValue = 0.0;
  double _prevAniValue = 0.0;

  List _texts = [
    '기획전',
    '컬렉션',
    '피드'
  ];

  Color _backgroundOn = Colors.grey[300];
  Color _backgroundOff = Colors.grey[100];

  ScrollController _scrollController = new ScrollController();

  List _keys = [];

  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _texts.length; index++) {
      _keys.add(new GlobalKey());
    }


    _controller = TabController(vsync: this, length: _texts.length);
    _controller.animation.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(
            vsync: this, duration: Duration(milliseconds: 75));

    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(
            vsync: this, duration: Duration(milliseconds: 150));

    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Container(
            child: AppBar(
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black,),
                          onPressed: () {
                            setState(() {
                              //page = 1;
                              build(context);
                            });
                          },
                        ),
                        //Text('댓글', style: textStyleBold,)
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
              width: 320,
              height: 60.0,
              child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _texts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        key: _keys[index],
                        padding: EdgeInsets.all(10.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                              animation: _colorTweenBackgroundOn,
                              builder: (context, child) =>
                                  FlatButton(
                                      color: _getBackgroundColor(index),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius
                                              .circular(7.0)),
                                      onPressed: () {
                                        setState(() {
                                          _buttonTap = true;
                                          _controller.animateTo(index);
                                          _setCurrentIndex(index);
                                          _scrollTo(index);
                                        });
                                      },
                                      child: Text(
                                        _texts[index],
                                      )),
                            )));
                  })),
          Flexible(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  Collections(),
                  UserCollections(),
                  FeedPage(),
                ],
              )),
        ]));
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation.value;

    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }

    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);

    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });

      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;
    double position = renderBox
        .localToGlobal(Offset.zero)
        .dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();
      position = renderBox
          .localToGlobal(Offset.zero)
          .dx;

      if (position > offset) offset = position;
    } else {

      renderBox = _keys[_texts.length - 1].currentContext.findRenderObject();
      position = renderBox
          .localToGlobal(Offset.zero)
          .dx;
      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }
}