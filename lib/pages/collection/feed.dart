import 'package:flutter/material.dart';

import 'package:newnew/models/user.dart';
import 'package:newnew/testInput.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  static int page = 1;
  static Post the_post = post1;

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview = {
      1 : getMain(),
      2 : getLikes(the_post.likes),
      3 : getComments(the_post.comments)
    };
    return pageview[page];
  }

  Widget getMain() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget> [
                Column(
                  children: getPosts(context),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index ++;
    }
    return posts;
  }

  Widget getPost(BuildContext context, Post post, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(backgroundImage: post.user.profilePicture,),
                    ),
                    Text(post.user.username, style: textStyleBold)
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 1),
            color: Colors.grey,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 282
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: post.image
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.favorite, size: 30, color: post.isLiked ? Colors.red : Colors.black,),
                      IconButton(icon: Icon(Icons.favorite), color: post.isLiked ? Colors.red : Colors.white,
                      onPressed: () {
                        setState(() {
                            userPosts[index].isLiked = post.isLiked ? false : true; 
                            if (!post.isLiked) {
                              post.likes.remove(user);
                            } else {
                              post.likes.add(user);
                            }                       
                          });
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.mode_comment, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.mode_comment), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.send, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.send), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  )
                ],
              ),
              Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.bookmark, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.bookmark), color: post.isSaved ? Colors.black : Colors.white,
                      onPressed: () {
                        setState(() {
                            userPosts[index].isSaved = post.isSaved ? false : true; 
                            if (!post.isSaved) {
                              user.savedPosts.remove(post);
                            } else {
                              user.savedPosts.add(post);
                            }                       
                          });
                      },)
                    ],
                  )
            ],
          ),
          FlatButton(
            child: Text("좋아요 " + post.likes.length.toString() + "개", style: textStyleBold,),
            onPressed: () {
                setState(() {
                  the_post = post;
                  page = 2; 
                  build(context);                 
                });
              },
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  post.user.username,
                  style: textStyleBold,
                ),
              ),
              Text(
                post.description,
                style: textStyle,
              )
            ],
          ),
          FlatButton(
            child: Text(post.comments.length.toString() + "개의 댓글 보기", style: textStyleLigthGrey,),
            onPressed: () {
              setState(() {
                  the_post = post;
                  page = 3; 
                  build(context);                 
                });
              },
          ),
        ],
      )
    );
  }

  Widget getLikes(List<User> likes) {
    List<Widget> likers = [];
    for (User follower in likes) {
      likers.add(new Container(
        height: 45,
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(follower.username, style: textStyleBold),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(3))
              ),
              child: FlatButton(
                color: user.following.contains(follower) ? Colors.white : Colors.blue,
                child: Text(user.following.contains(follower) ? "팔로잉" : "팔로워", style: TextStyle(fontWeight: FontWeight.bold, color: user.following.contains(follower) ? Colors.grey : Colors.white)),
                onPressed: () {
                  setState(() {
                    if (user.following.contains(follower)) {
                      user.following.remove(follower);
                    } else {
                      user.following.add(follower);
                    }
                  });
                },
              ),
            )
          ],
        ),
        onPressed: () {

        },
        )
      ));
    }
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("좋아요", style: textStyleBold),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            setState(() {
                page = 1;
                build(context);
            });
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: likers,
        ),
      ),
    );
  }

   Widget getComments(List<Comment> likes) {
    List<Widget> likers = [];
    DateTime now = DateTime.now();
    for (Comment comment in likes) {
      int hoursAgo = (now.hour) - (comment.dateOfComment.hour -1);
      likers.add(new Container(
        // height: 45,
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15,right: 10),
                  width: 40,
                  height: 40,
                  child: CircleAvatar(
                    backgroundImage: comment.user.profilePicture,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(margin: EdgeInsets.only(top: 10),),
                    RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: comment.user.username, style: textStyleBold),
                          new TextSpan(text: ' ', style: textStyle),
                          new TextSpan(text: comment.comment, style: textStyle),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 5),
                          child: Text(hoursAgo.toString() + "시간 전", style: textStyleLigthGrey,),
                        ),
                        Container(
                          child: Text("좋아요", style: textStyleLigthGrey,),
                          margin: EdgeInsets.only(right: 10, top: 5),
                        ),
                        Container(
                          child: Text("답글", style: textStyleLigthGrey,),
                          margin: EdgeInsets.only(right: 10, top: 5),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Stack(
                  alignment: Alignment(0, 0),
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.favorite, color: Colors.black, size: 15,)),
                      Container(
                          child: IconButton(
                            icon: Icon(Icons.favorite, color: comment.isLiked ? Colors.black : Colors.white, size: 10),
                            onPressed: () {
                              setState(() {
                                comment.isLiked = comment.isLiked ? false : true;
                              });
                           },
                      ),
                    )
                  ],
                ),
          ],
        ),
        onPressed: () {

        },
        )
      ));
    }
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                    onPressed: () {
                      setState(() {
                        page = 1;
                        build(context);
                      });
                    },
                  ),
                  Text('댓글', style: textStyleBold,)
                ],
              ),
              IconButton(
                icon: Icon(Icons.send, color: Colors.black,),
                onPressed: () {

                },
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: likers,
        ),
      ),
    );
  }
}