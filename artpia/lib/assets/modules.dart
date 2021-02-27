import 'package:artpia/assets/config.dart';
import 'package:artpia/pages/product/addProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserClass {
  String uid;
  String username;
  String password;
  String eMail;

  String imageURL;
  String bio;

  List<String> followers = [];
  List<String> following = [];

  Map<String, dynamic> toUserData() => {
        'uid': uid,
        'username': username,
        'password': password,
        'eMail': eMail,
        'imageURL': imageURL,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
}

class Product {
  String pid;
  String title;
  String description;
  Timestamp publishedDate;
  int price;
  int likes;
  String category;

  List<String> imageURL = [];
  List<String> tags = [];

  Product(
      {this.pid,
      this.title,
      this.description,
      this.publishedDate,
      this.price,
      this.likes,
      this.category,
      this.imageURL,
      this.tags});

  Product.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    title = json['title'];
    description = json['description'];
    publishedDate= json['publishedDate'];
    price= json['price'];
    likes= json['likes'];
    category= json['category'];
    imageURL= json['imageURL'];
    tags= json['tags'];
  }
}

class Tag {
  String tag;

  Map<String, dynamic> toTagData() => {
        'tag': tag,
      };
}

class Category {
  String level;
  String parent;
  String category;

  Map<String, dynamic> toCategoryData() => {
        'level': level,
        'parent': parent,
        'category': category,
      };
}

class ErrorAlertDialog extends StatelessWidget {
  final String message;

  const ErrorAlertDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
          child: Center(
            child: Text("OK"),
          ),
        )
      ],
    );
  }
}

class LoadingAlertDialog extends StatelessWidget {
  final String message;

  const LoadingAlertDialog({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //circularProgress(),
          SizedBox(
            height: 10,
          ),
          Text('Authenticating, Please wait.....'),
        ],
      ),
    );
  }
}

circularProgress() {
  return Container(
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.black),
    ),
  );
}

linearProgress() {
  return Container(
    alignment: Alignment.center,
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.black),
    ),
  );
}

Widget profileImage(BuildContext context, UserClass user) {
  String path =
      'gs://artpia.appspot.com/user/' + user.username + '+' + 'profile.jpg';
  // var image = FirebaseImage(path, shouldCache: true, maxSizeBytes: 20 * 1024 * 1024, cacheRefreshStrategy: CacheRefreshStrategy.BY_METADATA_DATE);

  return Container(
    child: CircleAvatar(
      // backgroundImage: image,
      backgroundColor: Colors.grey,
    ),
  );
}

Widget addProductFAT(BuildContext context) {
  Route route = MaterialPageRoute(builder: (context) => AddProductPage());
  return FloatingActionButton(onPressed: () {
    Navigator.push(context, route);
  });
}

class FavoriteItemCounter extends ChangeNotifier {
  int _counter =
      Artpia.sharedPreferences.getStringList(Artpia.userFavoriteList).length -
          1;

  int get count => _counter;

  Future<void> displayResult() async {
    int _counter =
        Artpia.sharedPreferences.getStringList(Artpia.userFavoriteList).length -
            1;
    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}

class AddressChanger extends ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  displayResult(int v) {
    _counter = v;
    notifyListeners();
  }
}

class TotalAmount extends ChangeNotifier {
  double _totalAmount = 0;

  double get totalAmount => _totalAmount;

  displayResult(double a) async {
    _totalAmount = a;

    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}
