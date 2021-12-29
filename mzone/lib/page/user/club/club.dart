import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClubPage extends StatefulWidget {
  _ClubPageState createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: placeAppBar(),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: categoryItems(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 242,
            margin: EdgeInsets.only(top: 20),
            child: listItems(),
          ),
        ],
      ),
    );
  }

  PreferredSize placeAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(CupertinoIcons.search),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItems() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
        categoryItem(),
      ],
    );
  }

  Widget listItems() {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
      ],
    );
  }

  Widget categoryItem() {
    return Container(
      width: 70,
      height: 30,
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.grey),
      child: Center(
        child: Text(
          "Item",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget listItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 120,
            height: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 265,
                height: MediaQuery.of(context).size.width - 265,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Group Title",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Group Master",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 130,
                      alignment: Alignment.centerRight,
                      child: Text(
                        "\n7 users",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}