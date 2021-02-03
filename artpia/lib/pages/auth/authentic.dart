import 'package:flutter/material.dart';

class AuthenticPage extends StatefulWidget {
  _AuthenticPageState createState() => _AuthenticPageState();
}

class _AuthenticPageState extends State<AuthenticPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [Image.asset('logo_main'), Button(context, 'Sign In')],
      ),
    );
  }

  Widget Button(BuildContext context, String title) {
    return Container(
      width: (MediaQuery.of(context).size.width - 20) / 2,
      height: 40,
      child: Center(
        child: Text(
          title,
          style: TextStyle(),
        ),
      ),
    );
  }
}
