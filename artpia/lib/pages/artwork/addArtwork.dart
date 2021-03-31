import 'dart:async';
import 'package:artpia/pages/artwork/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:artpia/assets/config.dart';
import 'package:artpia/assets/module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddArtworkPage extends StatefulWidget {
  @override
  _AddArtworkPageState createState() => _AddArtworkPageState();
}

class _AddArtworkPageState extends State<AddArtworkPage>
    with AutomaticKeepAliveClientMixin<AddArtworkPage> {
  bool get wantKeepAlive => true;

  final TextEditingController _titleTextEditController =
      TextEditingController();
  final TextEditingController _descriptionTextEditController =
      TextEditingController();
  final TextEditingController _priceTextEditController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int price;
  int likes;
  String category;

  List<String> tags = [];
  List<String> imageURL = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addArtworkAppBar(context),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            artworkImages(context),
            artworkField(context),
            uploadButton(context),
          ],
        ),
      ),
    );
  }

  Widget artworkImages(BuildContext context) {
    List<Widget> imageList = [emptyImageBox(context)];

    return Container(
      height: 118,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        scrollDirection: Axis.horizontal,
        children: imageList,
      ),
    );
  }

  Widget emptyImageBox(BuildContext context) {
    const double _length = 92;

    return Material(
      child: InkWell(
        onTap: () {
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          width: _length,
          height: _length,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget imageBox(BuildContext context) {
    const double _length = 92;

    return Material(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(right: 15),
          width: _length,
          height: _length,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget artworkField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [],
      ),
    );
  }

  Widget uploadButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {});
          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 2), () {});
                return AlertDialog(
                  content: Text('선택된 이미지가 없습니다!'),
                );
              });
        },
        child: InkWell(
          onTap: () {
            addArtwork(Artpia.sharedPreferences.getString('uid'));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width * (335 / 375),
            decoration: BoxDecoration(border: Border.all(width: 10)),
            height: 44,
            child: Center(
              child: Text(
                '등록하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future addArtwork(String uid) async {
    String pid = uid + DateTime.now().microsecondsSinceEpoch.toString();
    FirebaseFirestore.instance.collection("artwork").doc(pid).set({
      'uid': uid,
      'pid': pid,
      'title': _titleTextEditController.text.trim(),
      'category': 'test',
      'description': _descriptionTextEditController.text.trim(),
      'publishedDate': DateTime.now().millisecondsSinceEpoch.toString(),
      'price': _priceTextEditController.text.trim(),
      'likes': 0,
      // 'imageURL': userImgUrl,
      'tags': List<String>(),
      Artpia.userFavoriteList: ['init'],
    });
  }

  Future uploadImages(int index) async {
    showDialog(
      context: context,
      builder: (c) {
        return LoadingAlertDialog(message: 'Adding images, Please wait.');
      },
    );

    // String imgFileName = DateTime.now().millisecondsSinceEpoch.toString();
    // StorageReference storageReference =
    //     FirebaseStorage.instance.ref().child(imgFileName);
    // ByteData byteData = await asset.getByteData(quality: 100);
    // List<int> imgData = byteData.buffer.asUint8List();
    // StorageUploadTask storageUploadTask = storageReference.putData(imgData);
    // StorageTaskSnapshot storageTaskSnapshot =
    //     await storageUploadTask.onComplete;
    // await storageTaskSnapshot.ref.getDownloadURL().then((imgUrl) {
    //   imageURL[index] = imgUrl;
    // });
  }

//
// Widget artworkTags(BuildContext context) {
//   List<Widget> tagList = [ emptyTagBox(context)];
//
//   if (_tags?.isEmpty ?? true)
//     for (int i = 0; i < _tags.length; i++)
//       tagList.add(tagBox(context, _tags[i]));
//
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Text('태그 추가'),
//         ),
//         Container(
//           height: 45,
//           child: ListView(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//             scrollDirection: Axis.horizontal,
//             children: tagList,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Future<void> loadTags() async {
//   setState(() {
//     _formKey.currentState.save();
//     if (_tags == null) _tags = List<Tag>();
//   });
//
//   String tag;
//   String _error;
//
//   try {
//     tag = await showDialog<String>(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('태그를 추가하세요.'),
//             content: TextFormField(
//               onChanged: (value) => tag = value,
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//               cursorColor: primary,
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(left: 10),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(0),
//                     borderSide: BorderSide(
//                       color: primary,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(0),
//                     borderSide: BorderSide(
//                       color: primary,
//                     ),
//                   ),
//                   hintText: ''),
//             ),
//             actions: [
//               FlatButton(
//                 onPressed: () => Navigator.pop(context),
//                 color: primary,
//                 child: Text('취소'),
//               ),
//               FlatButton(
//                 onPressed: () => Navigator.pop(context, tag),
//                 color: primary,
//                 child: Text('추가'),
//               )
//             ],
//           );
//         });
//   } on Exception catch (e) {
//     _error = e.toString();
//   }
//
//   setState(() {
//     _tags.add(Tag(tag));
//     _error = _error;
//   });
// }
//
// Widget emptyTagBox(BuildContext context) {
//   const double _length = 30;
//
//   return Material(
//     child: InkWell(
//       onTap: () {
//         loadTags();
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 20),
//         width: _length,
//         height: _length,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           color: offWhite,
//         ),
//         child: Center(
//           child: Icon(Icons.add),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget tagBox(BuildContext context, Tag tag) {
//   return Material(
//     child: InkWell(
//       child: Container(
//         margin: EdgeInsets.only(left: 10),
//         width: tag.title.length * 10 + 30.0,
//         height: 30,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           color: offWhite,
//         ),
//         child: Stack(
//           alignment: Alignment.topRight,
//           children: [
//             Center(
//                 child: Center(
//                   child: Text(tag.title),
//                 )),
//             Material(
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     _tags.remove(tag);
//                   });
//                 },
//                 child: ImageIcon(
//                   AssetImage(delete_tag_idle),
//                   size: 12,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );

}
