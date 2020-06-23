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
                  width: MediaQuery.of(context).size.width,
                  // 375
                  height: MediaQuery.of(context).size.width + 5,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width - 25),
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
            Padding(
              padding: EdgeInsets.only(top: 30, right: 20),
              child: Container(
                child: Text('인기 검색어'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
              child: Text('NEW NEW PICK'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
              child: Text('인기 셀러'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
              child: new Text(
                '최근 본 상품',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    '#빈티지 가구',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    '+ 더보기',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    '모던한 취미',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
                  child: new Text(
                    '+ 더보기',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
