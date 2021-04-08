import 'package:flutter/material.dart';
import 'package:artpia/pages/order/module.dart';
import 'package:artpia/pages/order/orderResult.dart';

class OrderArtworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: orderAppBar(context),
      body: Container(
        child: Column(
          children: [
            artworkDetail(context),
            addressList(context),
            messageBox(context),
          ],
        ),
      ),
      floatingActionButton: orderButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget artworkDetail(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
            child: Image.asset('path'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title'),
                Text('12345 ' + 'Won'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addressList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Address List',style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Default Address'),
                Icon(Icons.add),
              ],
            ),
          ),
          Container(
            child: Text('407, an apartment, a road, Busan'),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jacob'),
                Text('010-0000-0000'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messageBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Message', style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget orderButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(builder: (context) => OrderResultPage());
        Navigator.push(context, route);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.black,
        child: Center(
          child: Text('Order',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    );
  }
}
