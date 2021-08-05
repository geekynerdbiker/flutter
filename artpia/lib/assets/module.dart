import 'package:flutter/material.dart';
import 'package:artpia/assets/config.dart';
import 'package:artpia/pages/artwork/addArtwork.dart';

class UserClass {
  String uid;
  String username;
  String imageURL;
  String bio;
  List<String> artworkList = [];
  List<String> orderList = [];
  String name;
  String address;

  UserClass(
      {this.uid,
      this.username,
      this.imageURL,
      this.bio,
      this.artworkList,
      this.orderList,
      this.name,
      this.address});

  Map<String, dynamic> toUserData() => {
        'uid': uid,
        'username': username,
        'imageURL': imageURL,
        'bio': bio,
        'artworkList': artworkList,
        'orderList': orderList,
        'name': name,
        'address': address,
      };

  UserClass.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    imageURL = json['imageURL'];
    bio = json['bio'];
    artworkList = json['artworkList'];
    orderList = json['orderList'];
    name = json['name'];
    address = json['address'];
  }
}

class ArtworkClass {
  String uid;
  String pid;
  String title;
  String description;
  int price;
  List<String> imageURL = [];

  ArtworkClass(
      {this.uid,
      this.pid,
      this.title,
      this.description,
      this.price,
      this.imageURL});

  Map<String, dynamic> toArtworkData() => {
        'uid': uid,
        'pid': pid,
        'title': title,
        'description': description,
        'price': price,
        'imageURL': imageURL,
      };

  ArtworkClass.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    pid = json['pid'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageURL = json['imageURL'];
  }
}

class OrderClass {
  String uid;
  String pid;
  String oid;
  String state;

  OrderClass({this.uid, this.pid, this.oid, this.state});

  Map<String, dynamic> toOrderData() => {
        'uid': uid,
        'pid': pid,
        'oid': oid,
        'state': state,
      };

  OrderClass.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    pid = json['pid'];
    oid = json['oid'];
    state = json['state'];
  }
}

class NotificationClass {
  String uid;
  String state;
  String type;
  String message;

  NotificationClass({this.uid, this.state, this.type, this.message});

  Map<String, dynamic> toNotificationData() => {
        'uid': uid,
        'state': state,
        'type': type,
        'message': message,
      };

  NotificationClass.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    state = json['state'];
    type = json['type'];
    message = json['message'];
  }
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
          Text('Authenticating, Please wait...'),
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
  // String path =
  //     'gs://artpia.appspot.com/user/' + user.username + '+' + 'profile.jpg';
  // var image = FirebaseImage(path, shouldCache: true, maxSizeBytes: 20 * 1024 * 1024, cacheRefreshStrategy: CacheRefreshStrategy.BY_METADATA_DATE);

  return Container(
    child: CircleAvatar(
      // backgroundImage: image,
      backgroundColor: Colors.grey,
    ),
  );
}

Widget addArtworkFAB(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, createRoute(AddArtworkPage()));
    },
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.black),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    ),
  );
}

class FavoriteItemCounter extends ChangeNotifier {
  int _counter =
      ArtpiaProject.sharedPreferences.getStringList(ArtpiaProject.userFavoriteList).length -
          1;

  int get count => _counter;

  Future<void> displayResult() async {
    int _counter =
        ArtpiaProject.sharedPreferences.getStringList(ArtpiaProject.userFavoriteList).length -
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

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
