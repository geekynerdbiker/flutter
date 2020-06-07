import 'package:flutter/material.dart';

import 'package:newnew/models/component.dart';
import 'package:newnew/pages/product/productDetailPage.dart';
import 'package:newnew/testInput.dart';

class HashTagList extends StatelessWidget {
  List<Widget> getHashTags(BuildContext context) {
    List<Widget> tags = [];
    int index = 0;
    for (Tag tag in tagItems) {
      tags.add(getHashTag(context, tag, index));
      index++;
    }
    return tags;
  }

  Widget getHashTag(BuildContext context, Tag tag, int index) {
    return Padding(
        padding: EdgeInsets.all(0),
        child: Material(
          child: InkWell(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(product)));
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                width: tag.name.length * 12.toDouble(),
                height: 30,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text(
                    tag.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getHashTags(context),
    );
  }
}
