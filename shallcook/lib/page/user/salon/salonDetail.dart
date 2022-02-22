import 'package:flutter/material.dart';

class SalonDetailPage extends StatelessWidget {
  const SalonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: salonDetailAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          description(context),
          preview(),
        ],
      ),
    );
  }

  AppBar salonDetailAppBar() {
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

  Widget description(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 170,
            color: Colors.black,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 12, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Shall We Cook?"),
                      Text("Doje"),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  child: const Text("Enjoy your meal! \n with us!"),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 37,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("11:30 AM 22th Feb, 2022"),
                          Text("Provide Place and Tools!"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("JINGUIS DAEYUN"),
                          Text("30000 Won"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget preview() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Preview"),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 126,
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
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 200,
      height: 126,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      // Image.network(item, fit: BoxFit.cover, width: 1000.0),
    );
  }
}
