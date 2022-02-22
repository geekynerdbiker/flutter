import 'package:flutter/material.dart';
import 'package:shallcook/page/user/salon/salonDetail.dart';

class SalonPage extends StatefulWidget {
  const SalonPage({Key? key}) : super(key: key);

  @override
  _SalonPageState createState() => _SalonPageState();
}

class _SalonPageState extends State<SalonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: salonAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          weeklySalons(),
          weeklySalons(),
        ],
      ),
    );
  }

  AppBar salonAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Container(
        color: Colors.blue,
        width: 200,
        height: 40,
      ),
    );
  }

  Widget weeklySalons() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("2nd Feb"),
                  Text("See All"),
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 226,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                listItem(),
                listItem(),
                listItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem() {
    return InkWell(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (context) => const SalonDetailPage());
        Navigator.pushReplacement(context, route);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 25),
        width: 183,
        height: 226,
        child: Column(
          children: [
            Container(
              width: 183,
              height: 151,
              color: Colors.black,
            ),
            Container(
              width: 183,
              height: 75,
              color: Colors.blue,
            ),
            // Image.network(item, fit: BoxFit.cover, width: 1000.0),
          ],
        ),
      ),
    );
  }
}
