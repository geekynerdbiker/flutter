import 'package:artpia/pages/order/orderResult.dart';
import 'package:flutter/material.dart';

class OrderArtworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            artworkInfo(context),
            addressList(context),
            messageBox(context),
            orderButton(context),
          ],
        ),
      ),
    );
  }

  Widget artworkInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
        width: 150,
        height: 50,
        color: Colors.black,
        child: Center(
          child: Text('Order',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    );
  }
}
