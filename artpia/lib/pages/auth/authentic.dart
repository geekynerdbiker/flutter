import 'package:artpia/pages/interface.dart';
import 'package:flutter/material.dart';
import 'package:artpia/pages/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:artpia/assets/config.dart';
import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/auth/signup.dart';
import 'package:artpia/pages/auth/modules.dart';

class AuthenticPage extends StatefulWidget {
  _AuthenticPageState createState() => _AuthenticPageState();
}

class _AuthenticPageState extends State<AuthenticPage> {
  final TextEditingController _emailTextEditController =
      TextEditingController();
  final TextEditingController _passwordTextEditController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailTextEditController,
            hintText: 'Name',
            isObsecure: false,
          ),
          CustomTextField(
            controller: _passwordTextEditController,
            hintText: 'E-Mail',
            isObsecure: false,
          ),
        ],
      ),
    );
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
          signUp();
        else if (title == 'Sign In')
          signIn();
        else if (title == 'Apple')
          apple();
        else
          google();
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

  void signUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void signIn() {
    _emailTextEditController.text.isNotEmpty &&
            _passwordTextEditController.text.isNotEmpty
        ? signInUser()
        : showDialog(
            context: context,
            builder: (c) {
              return ErrorAlertDialog(
                  message: 'Please write email and password.');
            });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  void signInUser() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(message: 'Authenticating, Please wait.');
        });
    User firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
            email: _emailTextEditController.text.trim(),
            password: _passwordTextEditController.text.trim())
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(message: error.message.toString());
          });
    });
    if (firebaseUser != null) {
      readData(firebaseUser).then((s) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future readData(User firebaseUser) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((dataSnapshot) async {
      await Artpia.sharedPreferences
          .setString('uid', dataSnapshot.data()[Artpia.userUID]);
      await Artpia.sharedPreferences.setString(
          Artpia.userEmail, dataSnapshot.data()[Artpia.userEmail]);
      await Artpia.sharedPreferences.setString(
          Artpia.userName, dataSnapshot.data()[Artpia.userName]);
      await Artpia.sharedPreferences.setString(
          Artpia.userProfileImageUrl,
          dataSnapshot.data()[Artpia.userProfileImageUrl]);
      List<String> favoriteList =
          dataSnapshot.data()[Artpia.userFavoriteList].cast<String>();
      await Artpia.sharedPreferences
          .setStringList(Artpia.userFavoriteList, favoriteList);
    });
  }

  void apple() {
    Route route = MaterialPageRoute(builder: (context) => InterfacePage());
    Navigator.push(context, route);
  }

  void google() {}
}
