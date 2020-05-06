import 'package:flutter/material.dart';

import 'models/component.dart';
import 'models/user.dart';

TextStyle textStyle = new TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = new TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey = new TextStyle(fontFamily: 'Gotham', color: Colors.grey);

User follower1 = new User('불스아이', AssetImage('lib/assets/profile01.jpg'), [], [], [], []);
User follower2 = new User('우디', AssetImage('lib/assets/profile02.jpg'), [], [], [], []);
User follower3 = new User('제시', AssetImage('lib/assets/profile03.jpg'), [], [], [], []);
User follower4 = new User('저그', AssetImage('lib/assets/profile04.jpg'), [], [], [], []);
User follower5 = new User('렉스', AssetImage('lib/assets/profile05.jpg'), [], [], [], []);
User follower6 = new User('미스터 포테이토', AssetImage('lib/assets/profile06.jpg'), [], [], [], []);

List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/post01.jpg'), user, "첫 게시글임 ㅎ", DateTime.now(), [follower1, follower2, follower3, follower4, follower5, follower6], [
    new Comment(follower1, "개쩐다!", DateTime.now(), false),
    new Comment(follower2, "멋있어요", DateTime.now(), false),
    new Comment(follower4, "이런거 올리지 마셈ㅋ", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post02.jpg'), follower1, "이거 쫌 개안네", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "뭔데 이게", DateTime.now(), false),
    new Comment(follower1, "배고프다", DateTime.now(), false),
    new Comment(user, "짱이네", DateTime.now(), false),
    new Comment(follower5, "나는야 렉스", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post03.jpg'), follower5, "어케했노", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "아직 모른다", DateTime.now(), false),
    new Comment(follower1, "우주 최고", DateTime.now(), false),
    new Comment(user, "짱이네", DateTime.now(), false),
    new Comment(follower5, "멋있어요!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post04.jpg'), follower3, "ㅋㅋㅋ", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "ㅋㅋㅋㅋㅋㅋㅋ", DateTime.now(), false),
    new Comment(follower1, "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ아", DateTime.now(), false),
    new Comment(user, "나만 안웃김?", DateTime.now(), false),
    new Comment(follower5, "ㅋㅋ", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post05.jpg'), follower3, "감성", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "감성충 나가라", DateTime.now(), false),
    new Comment(follower1, "에휴", DateTime.now(), false),
    new Comment(user, "왜ㅡㅡ", DateTime.now(), false),
    new Comment(follower5, "이쁘다", DateTime.now(), false)
  ], false, false),

];

Post post1 = new Post(new AssetImage('lib/assets/post06.jpg'), user, "내 글", DateTime.now(), [follower1, follower2, follower3], [], false, false);
final User user = new User('우주용사 버즈', AssetImage('lib/assets/profile00.jpg'), [
  follower1,
  follower2,
  follower3
], [
  follower1,
  follower2,
  follower3,
  follower4,
  follower5,
  follower6
], [], []);

List<Trend> trendItems = [
  new Trend('Nike'),
  new Trend('Adidas'),
  new Trend('Vans'),
  new Trend('Converse'),
  new Trend('Golden Goose'),
  new Trend('Test1'),
  new Trend('Test2'),
];

List<Category> categoryItems = [
  new Category('Outerwear'),
  new Category('Top'),
  new Category('Bottom'),
  new Category('Footwear'),
  new Category('Tailoring'),
  new Category('Accesories'),
];

List<Style> styleItems = [
  new Style('Street'),
  new Style('Vintage'),
  new Style('Luxury'),
  new Style('Casual'),
  new Style('Avant Garde'),
  new Style('Minimalist'),
];

List<Trend> latestTrendItems = [
  new Trend('Cardigans'),
  new Trend('Cargo Pants'),
  new Trend('Chore Jackets'),
];

List<Designer> designerItems = [
  new Designer('Supreme'),
  new Designer('Palace'),
  new Designer('Raf Simons'),
  new Designer('GUCCI'),
  new Designer('Balenciaga'),
  new Designer('Off-White'),
];

List<Collection> collectionItems = [
  new Collection('Collection 1'),
  new Collection('Collection 2'),
  new Collection('Collection 3'),
  new Collection('Collection 4'),
  new Collection('Collection 5'),
  new Collection('Collection 6'),
  new Collection('Collection 7'),
];

List<Collection> userCollectionItems = [
  new Collection('User Collection 1'),
  new Collection('User Collection 2'),
  new Collection('User Collection 3'),
  new Collection('User Collection 4'),
  new Collection('User Collection 5'),
  new Collection('User Collection 6'),
  new Collection('User Collection 7'),
  new Collection('User Collection 8'),
  new Collection('User Collection 9'),
  new Collection('User Collection 10'),
  new Collection('User Collection 11'),
  new Collection('User Collection 12'),
  new Collection('User Collection 13'),
  new Collection('User Collection 14'),
  new Collection('User Collection 15'),
  new Collection('User Collection 16'),
  new Collection('User Collection 17'),
  new Collection('User Collection 18'),
  new Collection('User Collection 19'),
  new Collection('User Collection 20'),
];

List<Product> productItems = [
  new Product('Product1', new Category('Clothes'), new Category('Top'), new Category('Shirts'), 1000),
];