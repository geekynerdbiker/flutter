import 'package:artpia/pages/auth/signup.dart';
import 'package:flutter/material.dart';

class AuthenticPage extends StatefulWidget {
  _AuthenticPageState createState() => _AuthenticPageState();
}

class _AuthenticPageState extends State<AuthenticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            banner(context),
            inputSector(context),
            authSector(context),
          ],
        ),
      ),
    );
  }

  Widget banner(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      width: MediaQuery.of(context).size.width - 20,
      height: (MediaQuery.of(context).size.width - 20) / 1.4,
      color: Colors.black,
    );
  }

  Widget inputSector(BuildContext context) {
    return Container();
  }

  Widget authSector(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            button(context, 'Sign In'),
            button(context, 'Sign Up'),
          ],
        ),
        Row(
          children: [
            button(context, 'Apple'),
            button(context, 'Google'),
          ],
        )
      ],
    );
  }

  Widget button(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        if (title == 'Sign Up')
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: (MediaQuery.of(context).size.width - 40) / 2,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
