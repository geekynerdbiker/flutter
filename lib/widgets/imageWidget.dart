import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String title;
  String uri;
  ImageWidget(this.title, this.uri);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, uri);
      },
    );
  }
}