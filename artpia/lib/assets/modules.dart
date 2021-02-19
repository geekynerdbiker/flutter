import 'package:artpia/assets/config.dart';
import 'package:artpia/main.dart';
import 'package:artpia/pages/product/addProduct.dart';
import 'package:flutter/material.dart';

class User {
  String uid;
  String username;
  String password;
  String eMail;

  String imageURL;
  String bio;

  List<String> followers = [];
  List<String> following = [];

  // DocumentReference reference;
  //
  // User.fromMap(Map<String, dynamic> map, {this.reference})
  //     : uid = map['uid'],
  //       username = map['username'],
  //       password = map['password'],
  //       eMail = map['eMail'],
  //       imageURL = map['imageURL'],
  //       bio = map['bio'],
  //       followers = List.from(map['followers']),
  //       following = List.from(map['following']),
  //
  // User.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // User.getUserData(DocumentSnapshot snapshot)
  //     : this.uid = snapshot.data['uid'],
  //       this.username = snapshot.data['username'],
  //       this.password = snapshot.data['password'],
  //       this.eMail = snapshot.data['eMail'],
  //       this.imageURL = snapshot.data['imageURL'],
  //       this.bio = snapshot.data['bio'],
  //       this.followers = List<String>.from(snapshot.data['followers']),
  //       this.following = List<String>.from(snapshot.data['following']),

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

  int price;
  int likes;
  String category;

  List<String> imageURL = [];
  List<String> tags = [];

  // DocumentReference reference;
  //
  //  Product.fromMap(Map<String, dynamic> map, {this.reference})
  //      : pid = map['pid'],
  //        title = map['title'],
  //        description = map['description'],
  //        price = map['price'],
  //        likes = map['likes'],
  //        category = map['category'],
  //        imageURL = List.from(map['imageURL']),
  //        tags = List.from(map['tags']);
  //
  //  Product.fromSnapshot(DocumentSnapshot snapshot)
  //      : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  //  Product.getProductData(DocumentSnapshot snapshot)
  //      : this.pid = snapshot.data['pid'],
  //        this.title = snapshot.data['title'],
  //        this.description = snapshot.data['description'],
  //        this.price = snapshot.data['price'],
  //        this.likes = snapshot.data['likes'],
  //        this.category = snapshot.data['catgory'],
  //        this.imageURL = List<String>.from(snapshot.data['imageURL']),
  //        this.tags = List<String>.from(snapshot.data['tags']);

  Map<String, dynamic> toProductData() => {
        'pid': pid,
        'title': title,
        'description': description,
        'price': price,
        'likes': likes,
        'category': category,
        'imageURL': imageURL,
        'tags': tags,
      };
}

class Tag {
  String tag;

  // DocumentReference reference;
  //
  // Tag.fromMap(Map<String, dynamic> map, {this.reference})
  //     : tag = map['tag'];
  //
  // Tag.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // Tag.getTagData(DocumentSnapshot snapshot)
  //     : this.tag = snapshot.data['tag'];

  Map<String, dynamic> toTagData() => {
        'tag': tag,
      };
}

class Category {
  String level;
  String parent;
  String category;

  // DocumentReference reference;
  //
  // Category.fromMap(Map<String, dynamic> map, {this.reference})
  //     : level = map['level'],
  //       parent = map['parent'],
  //       category = map['category'];
  //
  // Category.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, reference: snapshot.reference);
  //
  // Category.getCategoryData(DocumentSnapshot snapshot)
  //     : this.level = snapshot.data['level'],
  //       this.parent = snapshot.data['parent'],
  //       this.category = snapshot.data['category'];

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

Widget profileImage(BuildContext context, User user) {
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
