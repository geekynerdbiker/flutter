import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/collection.dart';

class User {
  String username;
  String password;
  String contact;
  String eMail;
  String address;
  String account;

  int createDate;
  int lastActivity;

  String imageURI;
  String intro;

  List<int> followers = [];
  List<int> following = [];
  List<int> selectedFavor = [];

  List<Product> favorite = [];
  List<Product> myProducts = [];
  List<Collection> myCollection = [];
}
