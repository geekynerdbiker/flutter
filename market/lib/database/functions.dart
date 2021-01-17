import 'package:bak/models/classes/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Firestore db = Firestore.instance;


// getCurrentUserInfo(widget.user.uid).then((value) => user = value);
Future getCurrentUserInfo() async{
  return (await FirebaseAuth.instance.currentUser()).uid;
}

