import 'package:bak/database/initialize.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/account/selectFavor2.dart';
import 'package:bak/pages/home/bootPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectFavorPage extends StatefulWidget {
  String username;
  SelectFavorPage({this.username});

  _SelectFavorPage createState() => _SelectFavorPage();
}

class _SelectFavorPage extends State<SelectFavorPage> {
  List<Tag> tagsWillBeAdded;
  List<TagItemForSignUp> _tags = [
    TagItemForSignUp('모던'),
    TagItemForSignUp('유니콘'),
    TagItemForSignUp('Nike'),
    TagItemForSignUp('베이직'),
    TagItemForSignUp('고가구'),
    TagItemForSignUp('블랙앤화이트'),
    TagItemForSignUp('친환경적인'),
    TagItemForSignUp('키치'),
    TagItemForSignUp('르 코르 뷔지에'),
    TagItemForSignUp('디자인 체어'),
    TagItemForSignUp('올드스쿨'),
    TagItemForSignUp('샤넬'),
    TagItemForSignUp('vans'),
    TagItemForSignUp('명상'),
    TagItemForSignUp('데이빗 보위'),
    TagItemForSignUp('레트로'),
    TagItemForSignUp('빈티지'),
    TagItemForSignUp('스트릿'),
    TagItemForSignUp('테크노'),
    TagItemForSignUp('아메리칸 캐주얼'),
    TagItemForSignUp('젠더리스'),
    TagItemForSignUp('러블리'),
    TagItemForSignUp('헬로키티'),
    TagItemForSignUp('럭셔리'),
    TagItemForSignUp('피규어'),
    TagItemForSignUp('y2k'),
    TagItemForSignUp('히스테릭 글래머'),
    TagItemForSignUp('그래픽 디자인'),
    TagItemForSignUp('바이닐'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSkip(context, '취향 선택', BootPage()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * (335 / 375),
        height: 44,
        child: FloatingActionButton.extended(
            heroTag: "confirm1",
            label: Text(
              "선택 완료",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            backgroundColor: Colors.black,
            onPressed: () {
              addTags();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BootPage()));
            }),

//            label: Text(
//              "다음 단계",
//              style: TextStyle(color: Colors.white),
//            ),
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(0))),
//            backgroundColor: Colors.black,
//            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => SelectFavorPage2()));
//            }),

      ),
      backgroundColor: offWhite,
      body: productTagList(context),
    );
  }

  Widget productTagList(BuildContext context) {
    return Container(
      child: Wrap(
        children: tagItemBuilder(context),
      ),
    );
  }

  List<Widget> tagItemBuilder(BuildContext context) {
    List<Widget> items = List<Widget>();

    for (int i = 0; i < _tags.length; i++)
      items.add(tagBox(context, _tags[i]));

    return items;
  }

  Widget tagBox(BuildContext context, TagItemForSignUp tag) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            tag.isSelected = !tag.isSelected;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: tag.title.length * 10 + 25.0,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: tag.isSelected ? primary : offWhite,
          ),
          child: Center(
              child: Center(
                child: Text(
                  tag.title,
                  style: selectionTag(
                    tag.isSelected ? offWhite : primary,
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void addTags() {
    StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return findUser(context, snapshot.data.documents);
      },
    );
  }

  Widget findUser(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<User> users = snapshot.map((e) => User.fromSnapshot(e)).toList();

    var result;
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == widget.username) {
        for (int j = 0; j < _tags.length; j++) {
          String eachTag = _tags[j].title;
          if (_tags[j].isSelected)
            Firestore.instance.collection('users')
                .document('username')
                .updateData(
                {
                  'selectedFavor': FieldValue.arrayUnion([eachTag]),
                });
        }
      }
      return result;
    }
  }
}

class TagItemForSignUp {
  String title;
  bool isSelected = false;

  TagItemForSignUp(this.title);
}


