import 'package:flutter/material.dart';

import 'package:artpia/assets/modules.dart';
import 'package:artpia/pages/general/profile/profile.dart';

Widget browseAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset('logo-image-path'),
    ),
  );
}

Widget hotArtists(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 30, left: 20),
        child: Text('Hot Artists'),
      ),
      // getArtists(context),
    ],
  );
}

// Widget getArtists(BuildContext context) {
//   return StreamBuilder<QuerySnapshot>(
//     stream: Firestore.instance.collection('user').snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) return CircularProgressIndicator();
//       return portraits(context, snapshot.data.documents);
//     },
//   );
// }
//
// Widget portraits(BuildContext context, List<DocumentSnapshot> snapshot) {
//   List<User> userItems = snapshot.map((e) => User.fromSnapshot(e)).toList();
//
//   return Container(
//     height: 130,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: userItems.length,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: EdgeInsets.only(top: 30, left: 20),
//           child: artistInfo(context, userItems[index]),
//         );
//       },
//     ),
//   );
// }

Widget artistInfo(BuildContext context, User user) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    child: Column(
      children: <Widget>[
        profileImage(context, user),
        Text('@' + user.username),
      ],
    ),
  );
}