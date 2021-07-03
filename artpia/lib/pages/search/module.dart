import 'package:artpia/pages/interface.dart';
import 'package:artpia/pages/search/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:artpia/assets/module.dart';

Widget searchAppBar(BuildContext context) {
  String keyword;

  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
        height: 25,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Route route = MaterialPageRoute(
                builder: (context) => InterfacePage(
                      searchResult: true, searchKeyword: keyword,
                    ));
            Navigator.push(context, route);
          },
          child: Text(
            'Search here!',
            style: TextStyle(color: Colors.black),
          ),
        )),
    leading: Center(
      child: Icon(
        CupertinoIcons.search,
        color: Colors.black,
      ),
    ),
  );
}

Widget searchResultAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.07,
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      child: Text(
        'Result',
        style: TextStyle(color: Colors.black),
      ),
    ),
    leading: FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Icon(CupertinoIcons.back),
    ),
  );
}

// Widget getArtists(BuildContext context) {
//   return StreamBuilder<QuerySnapshot>(
//     stream: FirebaseFirestore.instance.collection('user').snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) return CircularProgressIndicator();
//       return portraits(context, snapshot.data.docs);
//     },
//   );
// }
//
// Widget portraits(BuildContext context, List<DocumentSnapshot> snapshot) {
//   List<UserClass> userItems = snapshot.map((e) => UserClass.fromSnapshot(e)).toList();
//
//   return Container(
//     height: 130,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: userItems.length,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: EdgeInsets.only(top: 30, left: 20),
//           child: artistDetail(context, userItems[index]),
//         );
//       },
//     ),
//   );
// }
