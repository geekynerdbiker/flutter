import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/widgets/border.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:editsource/models/widgets/components/selection.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      appBar: appBarDefault(context, '상품 등록'),
      body: Scaffold(
        backgroundColor: offWhite,
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            productImages(context),
            productField(context),
            palette(context),
            stateSlider(context),
            addTag(context),
            acceptCardPayment(context),
          ],
        ),
      ),
    );
  }

  Widget productImages(BuildContext context) {
    return Container(
      height: 118,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageBox(context),
          imageBox(context),
        ],
      ),
    );
  }

  Widget imageBox(BuildContext context) {
    const double _length = 92;
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: _length,
      height: _length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: offWhite,
      ),
      child: Center(
        child: Icon(Icons.add),
      ),
    );
  }

  Widget productField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          textField(context, '상품명 입력'),
          textField(context, '카테고리'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shortTextField(context, '사이즈 입력 (선택)'),
              shortTextField(context, '재질 입력 (선택)'),
            ],
          ),
          textField(context, '브랜드 입력 (선택)'),
          textFieldLarge(context, '설명 입력'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shortTextField(context, '가격 입력'),
              shortTextField(context, '배송비 입력 (선택)'),
            ],
          ),
        ],
      ),
    );
  }

  Widget palette(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorCircle(context, Colors.red),
              colorCircle(context, Colors.orange),
              colorCircle(context, Colors.yellow),
              colorCircle(context, Colors.lightGreen),
              colorCircle(context, Colors.green),
              colorCircle(context, Colors.lightBlueAccent),
            ],
          ),
          hSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorCircle(context, Colors.blue),
              colorCircle(context, Colors.purple),
              colorCircle(context, Colors.pink),
              colorCircle(context, Colors.white),
              colorCircle(context, Colors.grey),
              colorCircle(context, Colors.black),
            ],
          )
        ],
      ),
    );
  }

  Widget colorCircle(BuildContext context, Color _color) {
    const double _r = 32;

    if (_color == Colors.white) {
      return Container(
        width: _r,
        height: _r,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(100),
            color: _color),
      );
    }

    return Container(
      width: _r,
      height: _r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: _color),
    );
  }

  Widget textField(BuildContext context, String _textContext) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: 3),
        child: TextFormField(
          style: TextStyle(
            fontSize: 12,
          ),
          decoration:
              InputDecoration(border: InputBorder.none, hintText: _textContext),
        ),
      ),
    );
  }

  Widget shortTextField(BuildContext context, String _textContext) {
    return Container(
      width: MediaQuery.of(context).size.width * (163 / 375),
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: 3),
        child: TextFormField(
          style: TextStyle(
            fontSize: 12,
          ),
          decoration:
              InputDecoration(border: InputBorder.none, hintText: _textContext),
        ),
      ),
    );
  }

  Widget textFieldLarge(BuildContext context, String _textContext) {
    return Container(
      width: MediaQuery.of(context).size.width * (335 / 375),
      height: 88,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: 3),
        child: TextFormField(
          style: TextStyle(
            fontSize: 12,
          ),
          decoration:
              InputDecoration(border: InputBorder.none, hintText: _textContext),
        ),
      ),
    );
  }

  Widget stateSlider(BuildContext context) {
    return Column(
      children: [
        StateSlider(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New'),
              Text('Old'),
            ],
          ),
        )
      ],
    );
  }

  Widget addTag(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('태그 추가'),
          productTags(context)
        ],
      ),
    );
  }
  
  Widget productTags(BuildContext context) {
    return Container(
      height: 45,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          tagBox(context),
          tagBox(context),
        ],
      ),
    );
  }

  Widget tagBox(BuildContext context) {
    const double _length = 30;
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: _length,
      height: _length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: offWhite,
      ),
      child: Center(
        child: Icon(Icons.add),
      ),
    );
  }
  
  Widget acceptCardPayment(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('카드 결제 허용하기'),
              SelectionSwitch(),
          ],),
          Text('택배 어쩌구 저쩌구'),
        ],
      ),
    );
  }
}

