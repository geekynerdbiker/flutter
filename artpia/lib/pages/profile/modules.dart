import 'package:flutter/material.dart';

import 'package:artpia/assets/modules.dart';

Widget profileAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 40,
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Container(
      width: MediaQuery.of(context).size.width * 2 / 5,
      child: Image.asset('logo-image-path'),
    ),
  );
}

Widget userProfile(BuildContext context, UserClass user) {
  return Column(
    children: [
      Row(
        children: [
          profileImage(context, user),
        ],
      ),
      Text(user.bio),
    ],
  );
}

Widget productList(BuildContext context, UserClass user) {
  return GridView.builder(
    gridDelegate: null,
    itemBuilder: null,
  );
}
