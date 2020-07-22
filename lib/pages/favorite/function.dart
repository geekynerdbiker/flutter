import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  User user;
  Product product;

  FavoriteButton({this.user, this.product});

  @override
  _FavoriteButton createState() => _FavoriteButton();
}

class _FavoriteButton extends State<FavoriteButton>{
  bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          !isLiked ? Firestore.instance.collection('users')
              .document(widget.user.username).updateData(
              {
                "favorite": FieldValue.arrayUnion(
                    [widget.product.userID + '+' + widget.product.title])
              }) : Firestore
              .instance.collection('users').document(
              widget.user.username).updateData(
              {
                "favorite": FieldValue.arrayRemove(
                    [widget.product.userID + '+' + widget.product.title])
              });
          setState(() {
            isLiked = !isLiked;
          });
        },
        child: Container(
          width: 12,
          height: 12,
          child: Center(
              child: !isLiked ? ImageIcon(
                AssetImage(favorite_idle_inverse),
                color: primary,
              ) : ImageIcon(
                AssetImage(favorite_active_inverse),
                color: primary,
              )
          ),
        ),
      ),
    );
  }
}