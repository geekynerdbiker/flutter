import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:newnewmarket/testInput.dart';

class Designer {
  String title;
  String imageURI;

  Designer(this.title);
}
class PopularDesigner extends StatelessWidget {

  List<Widget> getDesigners(BuildContext context) {
    List<Widget> designers = [];
    int index = 0;
    for (Designer designer in designerItems) {
      designers.add(getDesigner(context, designer, index));
      index ++;
    }
    return designers;
  }

  Widget getDesigner(BuildContext context, Designer designers, int index) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.grey)
        ),
        child: Center(
          child: Text(
            designers.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(left: 10, right: 10),
      crossAxisCount: 3,
      children: getDesigners(context),
    );
  }
}