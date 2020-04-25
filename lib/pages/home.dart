import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:newnewmarket/components/home/popularDesigners.dart';
import 'package:newnewmarket/components/home/shopByCategory.dart';
import 'package:newnewmarket/components/home/shopByStyle.dart';
import 'package:newnewmarket/components/home/shopLatestTrends.dart';
import 'package:newnewmarket/components/home/trendingSearch.dart';

import 'package:newnewmarket/widgets/imageWidget.dart';

// components -> widgets

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {

    Widget imageCarousel = new Container(
      height: 200,
      child: new CarouselSlider(
        items: <Widget>[
          ImageWidget('test1', 'lib/assets/photo4.jpg'),
          ImageWidget('test2', 'lib/assets/photo5.jpg'),
        ],
        options: CarouselOptions(
          height: 400,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        title: Text('NEWNEW MARKET'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            onPressed: (){},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: (){},
          )
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('NEWNEW'),
              accountEmail: Text('test@test.te'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
              decoration: new BoxDecoration(
                color: Colors.grey
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          imageCarousel,
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              '인기 검색어',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TrendingSearch(),

          new Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
            child: new Text(
              '카테고리',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 250,
            child: ShopByCategory(),
          ),

          new Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
            child: new Text(
              '스타일',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 300,
            child: ShopByStyle(),
          ),

          new Padding(
              padding: const EdgeInsets.all(12),
              child: new Text(
                '최근 트렌드',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ShopLatestTrends(),

          new Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 12.0, left: 12.0),
            child: new Text(
              '인기 디자이너',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 250,
            child: PopularDesigner(),
          ),
        ],
      ),
    );
  }


}