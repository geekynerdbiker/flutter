import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:artpia/assets/config.dart';
import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/home/home.dart';
import 'package:artpia/pages/auth/modules.dart';

class SignUpPage extends StatefulWidget {
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final TextEditingController _nameTextEditController = TextEditingController();
  final TextEditingController _emailTextEditController =
      TextEditingController();
  final TextEditingController _passwordTextEditController =
      TextEditingController();
  final TextEditingController _passwordConfirmTextEditController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userImgUrl = '';
  File _imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            userImg(context),
            SizedBox(
              height: 50,
            ),
            inputSector(context),
            SizedBox(
              height: 50,
            ),
            button(context, 'Confirm'),
          ],
        ),
      ),
    );
  }

  Widget userImg(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.15,
        backgroundColor: Colors.grey,
        backgroundImage: _imgFile == null ? null : FileImage(_imgFile),
        child: _imgFile == null
            ? (Icon(
                Icons.add,
                size: MediaQuery.of(context).size.width * 0.15,
                color: Colors.white,
              ))
            : null,
      ),
    );
  }

  Widget inputSector(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _nameTextEditController,
            hintText: 'Name',
            isObsecure: false,
          ),
          CustomTextField(
            controller: _emailTextEditController,
            hintText: 'E-Mail',
            isObsecure: false,
          ),
          CustomTextField(
            controller: _passwordTextEditController,
            hintText: 'Password',
            isObsecure: true,
          ),
          CustomTextField(
            controller: _passwordConfirmTextEditController,
            hintText: 'Confirm',
            isObsecure: true,
          ),
        ],
      ),
    );
  }

  Widget button(BuildContext context, String title) {
    return InkWell(
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

  Future<void> _selecteAndPickImg() async {
    _imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<void> uploadAndSaveImg() async {
    if (_imgFile == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(message: 'Please select an image file.');
          });
    } else {
      _passwordTextEditController.text ==
              _passwordConfirmTextEditController.text
          ? _nameTextEditController.text.isNotEmpty &&
                  _emailTextEditController.text.isNotEmpty &&
                  _passwordTextEditController.text.isNotEmpty &&
                  _passwordConfirmTextEditController.text.isNotEmpty
              ? uploadToStorage()
              : displayDialog('Fill up the complete form.')
          : displayDialog('Password does not match.');
    }
  }

  displayDialog(String msg) {
    showDialog(
      context: context,
      builder: (c) {
        return ErrorAlertDialog(
          message: msg,
        );
      },
    );
  }

  uploadToStorage() async {
    showDialog(
      context: context,
      builder: (c) {
        return LoadingAlertDialog();
      },
    );

    String imgFileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(imgFileName);
    StorageUploadTask storageUploadTask = storageReference.putFile(_imgFile);
    StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;
    await storageTaskSnapshot.ref.getDownloadURL().then((imgUrl) {
      userImgUrl = imgUrl;
      _registerUser();
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  void _registerUser() async {
    FirebaseUser firebaseUser;

    await _auth
        .createUserWithEmailAndPassword(
            email: _emailTextEditController.text.trim(),
            password: _passwordTextEditController.text.trim())
        .then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(message: error.message.toString());
          });
    });

    if(firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(FirebaseUser firebaseUser) async {
    Firestore.instance.collection("users").document(firebaseUser.uid).setData({
    'uid': firebaseUser.uid,
    'username': _nameTextEditController.text.trim(),
    'password': _passwordTextEditController.text.trim(),
    'eMail': firebaseUser.email,
    'imageURI': userImgUrl,
    'bio': '',
    'followers': List<String>(),
    'following': List<String>(),
    });

    await ArtpiaConfig.sharedPreferences.setString('uid', firebaseUser.uid);
    await ArtpiaConfig.sharedPreferences.setString(ArtpiaConfig.userEmail, firebaseUser.email);
    await ArtpiaConfig.sharedPreferences.setString(ArtpiaConfig.userName, _nameTextEditController.text);
    await ArtpiaConfig.sharedPreferences.setString(ArtpiaConfig.userProfileImageUrl, userImgUrl);
    await ArtpiaConfig.sharedPreferences.setStringList(ArtpiaConfig.userCartList, ['init']);
  }
}
