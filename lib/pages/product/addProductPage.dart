import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
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
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: offWhite,
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: offWhite,
                    ),
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  textField(context, '_textContext'),
                  textField(context, '_textContext'),
                  Row(children: [
                    shortTextField(context, '_textContext'),
                    shortTextField(context, '_textContext'),
                  ],),
                  textField(context, '_textContext'),
                  textField(context, '_textContext'),
                  Row(children: [
                    shortTextField(context, '_textContext'),
                    shortTextField(context, '_textContext'),
                  ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(BuildContext context, String _textContext) {
    return Container(
      height: 44,
      width: MediaQuery.of(context).size.width * (335 / 375),
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
      height: 44,
      width: MediaQuery.of(context).size.width * (163 / 375),
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
}
