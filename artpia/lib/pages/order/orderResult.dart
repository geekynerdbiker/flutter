import 'package:flutter/material.dart';

import 'package:artpia/pages/interface.dart';

class OrderResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check),
              Text('Ordered Successfully!'),
              goBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget goBackButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: 150,
      height: 50,
      color: Colors.black,
      child: InkWell(
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (context) => InterfacePage(true));
          Navigator.push(context, route);
        },
        child: Center(
          child: Text(
            'Go Back',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
