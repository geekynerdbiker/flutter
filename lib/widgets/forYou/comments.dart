//import 'package:flutter/material.dart';
//
//import 'package:newnew/models/component.dart';
//import 'package:newnew/pages/product/productDetailPage.dart';
//import 'package:newnew/testInput.dart';
//
//class CommentList extends StatelessWidget {
//  List<Widget> getComments(BuildContext context) {
//    List<Widget> comments = [];
//    int index = 0;
//    for (Comment comment in commentItems) {
//      comments.add(getComment(context, comment, index));
//      index++;
//    }
//    return comments;
//  }
//
//  Widget getComment(BuildContext context, Comment comment, int index) {
//    return Padding(
//      padding: EdgeInsets.all(0),
//      child: Column(
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              Container(
//                height: 40,
//                width: MediaQuery.of(context).size.width - 30,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Container(
//                          padding: EdgeInsets.all(5),
//                          height: 40,
//                          width: 40,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(100),
//                              color: Colors.grey),
//                          child: Image.asset(
//                            user.profilePicture,
//                            fit: BoxFit.cover,
//                          ),
//                        ),
//                        Container(
//                          width: 5,
//                        ),
//                        Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Container(
//                              width: 100,
//                              child: Text(
//                                user.username,
//                                style: TextStyle(
//                                    fontSize: 14, fontWeight: FontWeight.bold),
//                              ),
//                            ),
//                            Container(
//                              height: 20,
//                              width: 100,
//                              child: Text(
//                                comment.dateOfComment.toUtc().toString(),
//                                style:
//                                    TextStyle(fontSize: 12, color: Colors.grey),
//                              ),
//                            ),
//                          ],
//                        )
//                      ],
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 5, right: 5),
//                      child: Material(
//                        child: InkWell(
//                          onTap: () {
//                            //Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
//                          },
//                          child: Container(
//                            color: Colors.white,
//                            child: Icon(Icons.more_horiz),
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ],
//          ),
//          Container(
//            height: 10,
//          ),
//          Container(
//            padding: EdgeInsets.only(right: 20, left: 20),
//            height: MediaQuery.of(context).size.width * 1 / 5,
//            width: MediaQuery.of(context).size.width - 20,
//            child: Text(comment.comment),
//          ),
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Wrap(
//      children: getComments(context),
//    );
//  }
//}
