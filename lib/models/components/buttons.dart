import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:flutter/material.dart';

// Buttons
Widget primaryCTAIdle(BuildContext context, String textContext) {
  return Material(
    child: InkWell(
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * (335 / 375),
        height: 44,
        decoration:
            BoxDecoration(border: Border.all(color: primary), color: primary),
        child: Center(
          child: Text(
            textContext,
            style: cta(offWhite),
          ),
        ),
      ),
    ),
  );
}

Container primaryCTADisabled(BuildContext context, String textContext) {
  return Container(
    width: MediaQuery.of(context).size.width * (335 / 375),
    height: 44,
    decoration: BoxDecoration(border: Border.all(color: light), color: light),
    child: Center(
      child: Text(
        textContext,
        style: cta(offWhite),
      ),
    ),
  );
}

Container secondaryCTAIdle(BuildContext context, String textContext) {
  return Container(
    width: MediaQuery.of(context).size.width * (335 / 375),
    height: 44,
    decoration:
        BoxDecoration(border: Border.all(color: primary), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: cta(primary),
      ),
    ),
  );
}

Container secondaryCTADisabled(BuildContext context, String textContext) {
  return Container(
    width: MediaQuery.of(context).size.width * (335 / 375),
    height: 44,
    decoration:
        BoxDecoration(border: Border.all(color: light), color: offWhite),
    child: Center(
      child: Text(
        textContext,
        style: cta(light),
      ),
    ),
  );
}

Container action1Idle(BuildContext context, String textContext) {
  return Container(
    width: MediaQuery.of(context).size.width * (137 / 375),
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
    width: MediaQuery.of(context).size.width * (137 / 375),
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
      width: MediaQuery.of(context).size.width * (54 / 375),
      height: 24,
      decoration:
          BoxDecoration(border: Border.all(color: primary), color: offWhite),
      child: Center(
        child: Text(
          textContext,
          style: action2(primary),
        ),
      ));
}

Container action2Disabled(BuildContext context, String textContext) {
  return Container(
    width: MediaQuery.of(context).size.width * (54 / 375),
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

Container fab1Idle(BuildContext context, String textContext) {
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

Container fab1Disabled(BuildContext context, String textContext) {
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

Container fab2Idle(BuildContext context, String textContext) {
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

Container fab2Disabled(BuildContext context, String textContext) {
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

Widget shortTextField(BuildContext context, String _textContext, TextEditingController _controller) {
  return Container(
    width: MediaQuery.of(context).size.width * (163 / 375),
    height: 44,
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Padding(
      padding: EdgeInsets.only(left: 10, bottom: 7),
      child: TextFormField(
        controller: _controller,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration:
            InputDecoration(border: InputBorder.none, hintText: _textContext),
      ),
    ),
  );
}

Widget textField(BuildContext context, String _textContext, TextEditingController _controller) {
  return Container(
    width: MediaQuery.of(context).size.width * (335 / 375),
    height: 44,
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Padding(
      padding: EdgeInsets.only(left: 10, bottom: 7),
      child: TextFormField(
        controller: _controller,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration:
            InputDecoration(border: InputBorder.none, hintText: _textContext),
      ),
    ),
  );
}

Widget textFieldLarge(BuildContext context, String _textContext, TextEditingController _controller) {
  return Container(
    width: MediaQuery.of(context).size.width * (335 / 375),
    height: 88,
    margin: EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: _controller,
        maxLines: 5,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration:
            InputDecoration(border: InputBorder.none, hintText: _textContext),
      ),
    ),
  );
}

////////////////////////////////////////////////////////////////////
Widget longButton(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black), color: _color),
      child: Center(
        child: _widget,
      ),
    );
  else
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      color: _color,
      child: Center(
        child: _widget,
      ),
    );
}

Widget mediumButton(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Container(
      width: MediaQuery.of(context).size.width * (216 / 375),
      height: 44,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black), color: _color),
      child: Center(
        child: _widget,
      ),
    );
  else
    return Container(
      width: MediaQuery.of(context).size.width * (216 / 375),
      height: 44,
      color: _color,
      child: Center(
        child: _widget,
      ),
    );
}

Widget shortButton(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black), color: _color),
      child: Center(
        child: _widget,
      ),
    );
  else
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      color: _color,
      child: Center(
        child: _widget,
      ),
    );
}

Widget longButtonNav(BuildContext context, Color _color, bool _border,
    Widget _widget, Widget _nav) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: _widget,
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget longButtonNavHome(BuildContext context, Color _color, bool _border,
    Widget _widget) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => BootPage()), (route) => false);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: _widget,
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => BootPage()), (route) => false);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}


Widget mediumButtonNav(BuildContext context, Color _color, bool _border,
    Widget _widget, Widget _nav) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (216 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (216 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget shortButtonNav(BuildContext context, Color _color, bool _border,
    Widget _widget, Widget _nav) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _nav));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget longButtonPop(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (335 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget mediumButtonPop(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (216 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (216 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget shortButtonPop(
    BuildContext context, Color _color, bool _border, Widget _widget) {
  if (_border)
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: _color),
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
  else
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (163 / 375),
          height: 44,
          color: _color,
          child: Center(
            child: _widget,
          ),
        ),
      ),
    );
}

Widget seeMore(BuildContext context, Color _color, Widget _nav) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => _nav));
      },
      child: Container(
        child: Text(
          '+ 더보기',
          style:
          TextStyle(decoration: TextDecoration.underline, fontSize: 14, color: _color, fontFamily: 'SpoqaHanSans', fontWeight: FontWeight.w400),
        ),
      ),
    ),
  );
}