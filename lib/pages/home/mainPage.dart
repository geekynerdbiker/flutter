import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:newnew/widgets/home/popularDesigners.dart';
import 'package:newnew/widgets/home/shopByCategory.dart';
import 'package:newnew/widgets/home/shopByStyle.dart';
import 'package:newnew/widgets/home/shopLatestTrends.dart';
import 'package:newnew/widgets/home/trendingSearch.dart';

import 'package:newnew/widgets/imageWidget.dart';

// components -> widgets

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    Widget searchBar = new Container(
      child: new AppBar(
        elevation: 0.75,
        backgroundColor: Colors.white,
        title: Text('NEWNEW MARKET',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            onPressed: (){},
          )
        ],
      ),
    );

    Widget imageCarousel = new Container(
      height: MediaQuery.of(context).size.width / 2,
      child: new CarouselSlider(
        items: <Widget>[
          ImageWidget('test1', 'lib/assets/photo4.jpg'),
          ImageWidget('test2', 'lib/ass ets/photo5.jpg'),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.width / 2,
          autoPlay: true,
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          searchBar,
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
            height: MediaQuery.of(context).size.width / 3 * 2,
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
            height: MediaQuery.of(context).size.width / 5 * 4,
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
            height: MediaQuery.of(context).size.width / 3 * 2,
            child: PopularDesigner(),
          ),
        ],
      ),
    );
  }
}