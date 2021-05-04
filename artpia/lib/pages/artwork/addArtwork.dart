import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import 'package:artpia/pages/artwork/module.dart';

class AddArtworkPage extends StatefulWidget {
  @override
  _AddArtworkPageState createState() => _AddArtworkPageState();
}

class _AddArtworkPageState extends State<AddArtworkPage> {
  String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addArtworkAppBar(context),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            imageBox(context),
            description(context),
            addArtwork(context),
          ],
        ),
      ),
    );
  }

  Widget imageBox(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: () async {
            addImages();
          },
          child: Container(
            width: width,
            height: width * 3 / 4,
            color: Colors.black,
            child: Image.asset(path),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width / 5 - 25,
              height: width / 5 - 25,
              color: Colors.black,
            ),
            Container(
              width: width / 5 - 25,
              height: width / 5 - 25,
              color: Colors.black,
            ),
            Container(
              width: width / 5 - 25,
              height: width / 5 - 25,
              color: Colors.black,
            ),
            Container(
              width: width / 5 - 25,
              height: width / 5 - 25,
              color: Colors.black,
            ),
            Container(
              width: width / 5 - 25,
              height: width / 5 - 25,
              color: Colors.black,
            ),
          ],
        )
      ],
    );
  }

  void addImages() async {
    List<Media> res = await ImagesPicker.pick(
      count: 5,
      pickType: PickType.all,
      language: Language.System,
      cropOpt: CropOption(
          // aspectRatio: CropAspectRatio.wh16x9
          ),
    );
    if (res != null) {
      print(res.map((e) => e.path).toList());
      setState(() {
        path = res[0].thumbPath;
      });
      // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
      // print(status);
    }
  }

  Widget description(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text('Title of Artwork'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Text('Price of Artwork'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Text('Description of Artwork'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addArtwork(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              "Add Artwork",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
