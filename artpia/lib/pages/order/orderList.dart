import 'package:artpia/pages/order/module.dart';
import 'package:artpia/pages/order/orderDetail.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatefulWidget {
  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: orderAppBar(context),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            testItem(context),
            testItem(context),
            testItem(context),
            testItem(context),
            testItem(context),
            testItem(context),
          ],
        ),
      ),
    );
  }

  Widget testItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => OrderDetailPage());
              Navigator.push(context, route);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), color: Colors.black),
              // child: Image.asset('path'),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title'),
                    Text('12345 ' + 'Won'),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    width: 150,
                    height: 30,
                    child: Center(
                      child: Text('Delivery Number'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
