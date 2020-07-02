import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/designs/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {
  User _user;

  ChatRoomPage(User _user) {
    this._user = _user;
  }

  @override
  _ChatRoomPage createState() => _ChatRoomPage();
}

class _ChatRoomPage extends State<ChatRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chat(context, widget._user),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              message(context, '_message', true),
              message(context, '_message', false),
            ],
          ),
          inputBox(context),
        ],
      ),
    );
  }

  Widget timeBox(BuildContext context, String _message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text('Time'),
      ),
    );
  }

  Widget message(BuildContext context, String _message, bool _isMine) {
    if (_isMine)
      return Container(
        margin: EdgeInsets.only(bottom: 8, left: 40, right: 8),
        padding: EdgeInsets.all(8),
        width: _message.length.toDouble(),
        color: light,
        child: Text(_message),
      );
    else
      return Container(
        margin: EdgeInsets.only(bottom: 8, left: 8, right: 40),
        padding: EdgeInsets.all(8),
        width: _message.length.toDouble(),
        decoration: BoxDecoration(border: Border.all(color: semiLight)),
        child: Text(_message),
      );
  }

  Widget product(BuildContext context, Product _product, bool _isMine) {
   if (_isMine )
     return Container(
       margin: EdgeInsets.only(bottom: 8, left: 40, right: 8),
       child: produtItem(context, _product),
     );
   else
     return Container(
       margin: EdgeInsets.only(bottom: 8, left: 8, right: 40),
       child: produtItem(context, _product),
     );
  }

  Widget produtItem(BuildContext context, Product _product) {
      return Container(
        width: 200,
        height: 200,
        color: semiLight,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 50,
              padding: EdgeInsets.all(8),
              color: offWhite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_product.title),
                      Text(_product.price.toString()),
                    ],
                  ),
                  ImageIcon(
                    AssetImage(forward_idle),
                    size: 12,
                  )
                ],
              ),
            ),
            Container(
              child: Image.asset(_product.imageURItest, fit: BoxFit.cover,),
            )
          ],
        ),
      );
  }

  Widget inputBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * (337 / 375),
      decoration: BoxDecoration(border: Border.all(color: dark)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 280,
            child: TextFormField(
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 4,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '메세지를 입력하세요.'),
            ),
          ),
          ImageIcon(
            AssetImage(photo_idle),
            size: 24,
          ),
        ],
      ),
    );
  }
}
