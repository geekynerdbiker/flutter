import 'package:artpia/pages/artwork/artworkDetail.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import 'package:artpia/pages/profile/module.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: profileAppBar(context),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            userProfile(context),
            SizedBox(
              height: 20,
            ),
            artworkList(context),
          ],
        ),
      ),
    );
  }

  Widget userProfile(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Name',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            ' City, Country',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  void addImages() async {
    List<Media> res = await ImagesPicker.pick(
      count: 1,
      pickType: PickType.all,
      language: Language.System,
      cropOpt: CropOption(),
    );
    if (res != null) {
      print(res.map((e) => e.path).toList());
      setState(() {
        path = res[0].thumbPath;
      });
    }
  }

  Widget artworkList(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Artworks',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
              item(context),
            ],
          ),
        ),
      ],
    ));
  }

  Widget item(BuildContext context) {
    return InkWell(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (context) => ArtworkDetailPage());
        Navigator.push(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.black)),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.width / 2 - 30,
        // child: Image.netartwork(artwork.imageURL[0]),
      ),
    );
  }
}
