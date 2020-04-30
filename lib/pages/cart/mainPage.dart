import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                  ],
                ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
      ),
    );
  }
}
