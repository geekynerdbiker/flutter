import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/widgets/components/navigation.dart';
import 'package:editsource/models/widgets/components/selection/indicator.dart';
import 'package:editsource/models/widgets/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: mainAppBar(context),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * ( 375 / 375 ),
                  height: MediaQuery.of(context).size.width * ( 460 / 375 ),
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * ( 460 / 375 ) - 45),
                  child: Center(
                    child: imageCarouselIndicator(0, 5),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Center(
                    child: SearchField(),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.width * ( 201 / 375 ),
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text('인기 검색어'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * ( 336 / 375 ),
              color: accent1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 20),
                    child: Text('NEW NEW PICK'),
                  ),
                ],
              )
            ),

            Container(
              height: MediaQuery.of(context).size.width * ( 211 / 375 ),
              color: offWhite,
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text('인기 셀러'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * ( 251 / 375 ),
              color: accent2,
              child: Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: new Text(
                  '최근 본 상품',
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.width * ( 365 / 375 ),
              child: Column(children: [
                Container(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: new Text(
                        '#' + 'Hashtag Title',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 20),
                      child: new Text(
                        '+ 더보기',
                      ),
                    ),
                  ],
                ),
              ],),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              child: new Text(
                '컬렉션',
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * ( 772 / 375 ),
              color: accent3,
              child: Column(children: [

              ],),
            ),

          ],
        ),
      ),
    );
  }
}