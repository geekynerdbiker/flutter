import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditPhoneNumber extends StatefulWidget {
  User user;

  EditPhoneNumber({this.user});

  @override
  _EditPhoneNumber createState() => _EditPhoneNumber();
}

class _EditPhoneNumber extends State<EditPhoneNumber> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String phoneNumber;
  String verifyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '연락처 변경'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              textFieldAuth(context),
              textFieldVerifyCode(context),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: confirmButton(context),
          )
        ],
      ),
    );
  }

  Widget textFieldAuth(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        textFieldPhoneNumber(context),
        wSpacer(10),
        shortButtonRequestAuth(
            context,
            primary,
            false,
            Text(
              '인증요청',
              style: label(offWhite),
            )),
      ],
    );
  }

  Widget textFieldPhoneNumber(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (227 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.numberWithOptions(signed: true),
        validator: (value) {
          if (value.length != 11) return '휴대폰 번호가 올바르지 않습니다.';
          return null;
        },
        onSaved: (value) {
          phoneNumber = value;
        },
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '휴대폰 번호를 입력하세요.'),
      ),
    );
  }

  Widget shortButtonRequestAuth(
      BuildContext context, Color _color, bool _border, Widget _widget) {
    if (_border)
      return Container(
        width: MediaQuery.of(context).size.width * (100 / 375),
        height: 44,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), color: _color),
        child: Center(
          child: _widget,
        ),
      );
    else
      return Container(
        width: MediaQuery.of(context).size.width * (100 / 375),
        height: 44,
        color: _color,
        child: Center(
          child: _widget,
        ),
      );
  }

  Widget textFieldVerifyCode(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: TextFormField(
        inputFormatters: [
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.numberWithOptions(signed: true),
        validator: (value) {
          if (value.length != 6) return '인증번호가 올바르지 않습니다.';
          return null;
        },
        onSaved: (value) {
          verifyCode = value;
        },
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            border: InputBorder.none,
            hintText: '인증번호를 입력하세요.'),
      ),
    );
  }

  Widget confirmButton(BuildContext context) {
    final FormState form = _formKey.currentState;
    return Column(
      children: [
        Material(
          child: InkWell(
            onTap: () {
              _autoValidate = true;
              if (validateAndSave()) {
                form.save();
                change();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * (335 / 375),
              height: 44,
              color: primary,
              child: Center(
                child: Text(
                  '변경하기',
                  style: label(offWhite),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Text('연락처 변경은 1회만 가능합니다.'),
        ),
      ],
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void change() {

    Firestore.instance
        .collection('users')
        .document(widget.user.username)
        .updateData({"contact": phoneNumber});
  }
}
