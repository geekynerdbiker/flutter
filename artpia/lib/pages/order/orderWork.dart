import 'package:flutter/material.dart';

class OrderArtworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget workInfo(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Image.asset('path'),
          ),
          Container(
            child: Column(
              children: [
                Text('Title'),
                Text('price' + 'Won'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addressList(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Address List'),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Default Address'),
                Icon(Icons.add),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text('name'),
                Text('contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBox(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Delivery Message'),
          Container(),
        ],
      ),
    );
  }

  Widget orderButton(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Order'),
      ),
    );
  }
}