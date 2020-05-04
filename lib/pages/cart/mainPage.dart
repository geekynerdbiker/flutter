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
            elevation: 0.75,
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
                          });
                        },
                      ),
                      Text('장바구니', style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ],
              ),
            ),backgroundColor: Colors.white,
          ),
        ),
      ],
      ),
    );
  }
}
