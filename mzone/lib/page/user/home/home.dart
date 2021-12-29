import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          bannerList(),
          bannerList2(),
          bannerList3(),
        ],
      ),
    );
  }

  PreferredSize homeAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(220.0),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(CupertinoIcons.bell),
                ),
              ),
              userCard(),
            ],
          )
        ),
      ),
    );
  }

  Widget userCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Jacob",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Nice to Meet you",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "#Motocycle #Computer #Code",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "ENTP",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bannerList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          listItem(),
          listItem(),
          listItem(),
          listItem(),
        ],
      ),
    );
  }

  Widget bannerList2() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "The day of group",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                listItem2(),
                listItem2(),
                listItem2(),
                listItem2(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bannerList3() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Reserve nearby",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                listItem3(),
                listItem3(),
                listItem3(),
                listItem3(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listItem() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 70,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
    );
  }

  Widget listItem2() {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
    );
  }

  Widget listItem3() {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 70,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
    );
  }
}
