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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputSector(context),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('OR'),
            ),
            socialOptions(context),
          ],
        ),
      ),
    );
  }

  Widget inputSector(BuildContext context) {
    return Container(
      height: 160,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _emailTextEditController,
              hintText: 'e-mail',
              isObsecure: false,
            ),
            CustomTextField(
              controller: _passwordTextEditController,
              hintText: 'password',
              isObsecure: false,
            ),
            SizedBox(height: 5,),
            InkWell(
              onTap: () {
                print('Sign In');
              },
              child: Text('Sign In', style: TextStyle(fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialOptions(BuildContext context) {
    return Column(
      children: [
        button(context, 'Google'),
        button(context, 'Apple'),
        button(context, 'Facebook'),
      ],
    );
  }

  Widget button(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        switch (title) {
          case 'Sign In':
            signIn();
            return;
          case 'Sign Up':
            signUp();
            return;
          case 'Google':
            google();
            return;
          case 'Apple':
            apple();
            return;
          case 'Facebook':
            facebook();
            return;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50)),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: (MediaQuery.of(context).size.width - 100),
        height: 30,
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
      await Artpia.sharedPreferences
          .setString(Artpia.userEmail, dataSnapshot.data()[Artpia.userEmail]);
      await Artpia.sharedPreferences
          .setString(Artpia.userName, dataSnapshot.data()[Artpia.userName]);
      await Artpia.sharedPreferences.setString(Artpia.userProfileImageUrl,
          dataSnapshot.data()[Artpia.userProfileImageUrl]);
      List<String> favoriteList =
          dataSnapshot.data()[Artpia.userFavoriteList].cast<String>();
      await Artpia.sharedPreferences
          .setStringList(Artpia.userFavoriteList, favoriteList);
    });
  }

  void google() {
    Route route = MaterialPageRoute(builder: (context) => InterfacePage());
    Navigator.push(context, route);
  }

  void apple() {
    print('Apple Sign In');
  }

  void facebook() {
    print('Facebook Sign In');
  }
}
