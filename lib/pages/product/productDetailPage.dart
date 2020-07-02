import 'package:editsource/models/classes/product.dart';
import 'package:editsource/models/classes/user.dart';
import 'package:editsource/models/components/border.dart';
import 'package:editsource/models/components/buttons.dart';
import 'package:editsource/models/components/cards.dart';
import 'package:editsource/models/components/selection.dart';
import 'package:editsource/models/components/user.dart';
import 'package:editsource/models/designs/colors.dart';
import 'package:editsource/models/components/navigation.dart';
import 'package:editsource/models/designs/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  Product product;

  ProductDetailPage(Product product) : this.product = product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '상품 상세'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          userMarquee2(context, new User('username', 1, '.')),
          carousel(context),
          productInfo(context),
          productInfo2(context),
          productScroll(context),
          productScroll(context),
          borderLineGreyLite(context),
          actionButtons(context),
        ],
      ),
    );
  }

  Widget carousel(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (375 / 375),
          height: MediaQuery.of(context).size.width * (360 / 375),
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * (360 / 375) - 30),
          child: Center(
            child: imageCarouselIndicator(0, 5),
          ),
        ),
      ],
    );
  }

  Widget productInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item Name'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Item Price'),
              wSpacer(9),
              Text('Update Time'),
            ],
          ),
          hSpacer(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Fee'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ImageIcon(AssetImage(favorite_idle)),
                      Text('111')
                    ],
                  ),
                  wSpacer(20),
                  Column(
                    children: [ImageIcon(AssetImage(save_idle)), Text('111')],
                  ),
                  wSpacer(20),
                  ImageIcon(AssetImage(share_idle)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productInfo2(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('사이즈: ' + 'Item Size'),
                  Text('소재: ' + 'Item Material'),
                  Text('색상: ' + 'Item Color'),
                  Text('상태: ' + 'Item State'),
                  hSpacer(15)
                ],
              ),
              ShortStateSlider(4),
            ],
          ),
          hSpacer(20),
          Text(
              'User Item Description. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'),
          tagList(context),
        ],
      ),
    );
  }

  Widget tagList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          tagItem(context),
          tagItem(context),
          tagItem(context),
        ],
      ),
    );
  }

  Widget tagItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Text(
        '#' + 'ItemTag',
        style: TextStyle(color: semiDark),
      ),
    );
  }

  Widget productScroll(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Text('Section title'),
              ImageIcon(AssetImage(forward_idle)),
            ],
          ),
        ),
        productList(context),
      ],
    );
  }
  
  Widget productList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      child: ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
          Container(
            margin: EdgeInsets.only(right: 8),
            child: productItemCardSmall(context, new Product('title', 111, '/')),
          ),
        ],
      ),
    );
  }

  Widget actionButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          shortButton(context, offWhite, true, Text('대화하기')),
          shortButton(context, primary, true, Text('구매하기', style: TextStyle(color: offWhite),)),
        ],
      ),
    );
  }
}
