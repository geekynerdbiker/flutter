import 'package:bak/models/classes/collection.dart';
import 'package:bak/models/classes/product.dart';
import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/buttons.dart';
import 'package:bak/models/components/cards.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/models/designs/typos.dart';
import 'package:bak/pages/collection/collectionItem.dart';
import 'package:bak/pages/collection/editCollection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';

class CollectionDetailPage extends StatefulWidget {
  Collection collection;
  User user;

  CollectionDetailPage({this.collection, this.user});

  @override
  _CollectionDetailPageState createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int selectedIndex = 0;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(initialIndex: selectedIndex, vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, 'Collection'),
      backgroundColor: offWhite,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 2 / 5,
        child: floatingButton(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          collectionInfo(context),
          widget.user.username == widget.collection.userID
              ? CollectionItem(
                  user: widget.user,
                  collection: widget.collection,
                  isMine: true,
                )
              : tabBar(context),
        ],
      ),
    );
  }

  Widget floatingButton(BuildContext context) {
    return FloatingActionButton.extended(
        label: Text(
          "컬렉션 참여하기",
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: offWhite),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        backgroundColor: Colors.black,
        onPressed: () {});
  }

  Widget collectionInfo(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * (260 / 375),
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: FirebaseImage(widget.collection.imageURI,
                shouldCache: true,
                maxSizeBytes: 20 * 1024 * 1024,
                cacheRefreshStrategy: CacheRefreshStrategy.NEVER),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        widget.collection.title +
                            ' (' +
                            widget.collection.products.length.toString() +
                            ')',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'by ' + widget.collection.userID,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                widget.user.username != widget.collection.userID
                    ? Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Material(
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  isFollowing = !isFollowing;
                                });
                              },
                              child: !isFollowing
                                  ? action2Idle(context, '+ 팔로우')
                                  : action2Activate(context, '팔로잉')),
                        ))
                    : Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Material(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditCollectionPage(user: widget.user, collection: widget.collection,)));
                              },
                              child: ImageIcon(AssetImage(edit_idle))),
                        ),
                      )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      '아이템 ' + widget.collection.products.length.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '팔로워 ' + widget.collection.followers.length.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Text(widget.collection.description),
        ),
      ],
    );
  }

  Widget tabBar(BuildContext context) {
    int myProducts = 0;
    int usersProducts = 0;

    for (int i = 0; i < widget.collection.products.length; i++)
      for (int j = 0; j < widget.user.myProducts.length; j++)
        if (widget.collection.products[i] == widget.user.myProducts[j])
          myProducts++;

    usersProducts = widget.collection.products.length - myProducts;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        TabBar(
          controller: _controller,
          labelColor: primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: primary,
          tabs: [
            Tab(
              icon: Text('나의 컬렉션 (' + myProducts.toString() + ')'),
            ),
            Tab(
              icon: Text('유저들의 컬렉션 (' + usersProducts.toString() + ')'),
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              _controller.animateTo(index);
            });
          },
        ),
        IndexedStack(
          children: <Widget>[
            Visibility(
              child: CollectionItem(
                user: widget.user,
                collection: widget.collection,
                isMine: true,
              ),
              maintainState: true,
              visible: selectedIndex == 0,
            ),
            Visibility(
              child: CollectionItem(
                user: widget.user,
                collection: widget.collection,
                isMine: false,
              ),
              maintainState: true,
              visible: selectedIndex == 1,
            ),
          ],
          index: selectedIndex,
        ),
      ],
    );
  }

  Widget productItemList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('products')
          .where('collections',
              arrayContains:
                  widget.collection.userID + '+' + widget.collection.title)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return buildProductBody(context, snapshot.data.documents);
      },
    );
  }

  Widget buildProductBody(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Product> productItems =
        snapshot.map((e) => Product.fromSnapshot(e)).toList();

    return Container(
      height: 280 * (productItems.length / 2 + 1),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5),
          scrollDirection: Axis.vertical,
          itemCount: productItems.length,
          itemBuilder: (context, index) {
            return productItemCardLarge(
                context, productItems[index], widget.user);
          }),
    );
  }
}
