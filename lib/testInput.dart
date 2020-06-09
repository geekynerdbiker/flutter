import 'package:flutter/material.dart';

import 'models/component.dart';

List<User> userList = [
new User('불스아이', ('lib/assets/profile01.jpg'), [], [], [], [], wishList1),
new User('우디', ('lib/assets/profile02.jpg'), [], [], [], [], myItems1),
new User('제시', ('lib/assets/profile03.jpg'), [], [], [], [], empty),
new User('저그', ('lib/assets/profile04.jpg'), [], [], [], [], wishList1),
new User('렉스', ('lib/assets/profile05.jpg'), [], [], [], [], myItems1),
new User('미스터 포테이토', ('lib/assets/profile06.jpg'), [], [], [], [], recentView1),
];

List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/post01.jpg'), user, "첫 게시글임 ㅎ", DateTime.now(), [userList[0], userList[1], userList[2], userList[3], userList[4], userList[5]], [
    new Comment(userList[0], "개쩐다!", DateTime.now(), false),
    new Comment(userList[1], "멋있어요", DateTime.now(), false),
    new Comment(userList[3], "이런거 올리지 마셈ㅋ", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post02.jpg'), userList[0], "이거 쫌 개안네", DateTime.now(), [user, userList[1], userList[2], userList[3], userList[4]], [
    new Comment(userList[2], "뭔데 이게", DateTime.now(), false),
    new Comment(userList[0], "배고프다", DateTime.now(), false),
    new Comment(user, "짱이네", DateTime.now(), false),
    new Comment(userList[4], "나는야 렉스", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post03.jpg'), userList[4], "어케했노", DateTime.now(), [user, userList[1], userList[2], userList[3], userList[4]], [
    new Comment(userList[2], "아직 모른다", DateTime.now(), false),
    new Comment(userList[0], "우주 최고", DateTime.now(), false),
    new Comment(user, "짱이네", DateTime.now(), false),
    new Comment(userList[4], "멋있어요!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post04.jpg'), userList[2], "ㅋㅋㅋ", DateTime.now(), [user, userList[1], userList[2], userList[3], userList[4]], [
    new Comment(userList[2], "ㅋㅋㅋㅋㅋㅋㅋ", DateTime.now(), false),
    new Comment(userList[0], "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ아", DateTime.now(), false),
    new Comment(user, "나만 안웃김?", DateTime.now(), false),
    new Comment(userList[4], "ㅋㅋ", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post05.jpg'), userList[2], "감성", DateTime.now(), [user, userList[1], userList[2], userList[3], userList[4]], [
    new Comment(userList[2], "감성충 나가라", DateTime.now(), false),
    new Comment(userList[0], "에휴", DateTime.now(), false),
    new Comment(user, "왜ㅡㅡ", DateTime.now(), false),
    new Comment(userList[4], "이쁘다", DateTime.now(), false)
  ], false, false),

];

Post post1 = new Post(new AssetImage('lib/assets/post06.jpg'), user, "내 글", DateTime.now(), [userList[0], userList[1], userList[2]], [], false, false);
final User user = new User('우주용사 버즈', ('lib/assets/profile00.jpg'), [
  userList[0],
  userList[1],
  userList[2]
], [
  userList[0],
  userList[1],
  userList[2],
  userList[3],
  userList[4],
  userList[5]
], [], [], myItems1);

List<Tag> trendItems = [
  new Tag('Nike'),
  new Tag('Adidas'),
  new Tag('Vans'),
  new Tag('Converse'),
  new Tag('Golden Goose'),
  new Tag('Test1'),
  new Tag('Test2'),
];

List<Tag> categoryItems = [
  new Tag('Outerwear'),
  new Tag('Top'),
  new Tag('Bottom'),
  new Tag('Footwear'),
  new Tag('Tailoring'),
  new Tag('Accesories'),
];

List<Tag> styleItems = [
  new Tag('Street'),
  new Tag('Vintage'),
  new Tag('Luxury'),
  new Tag('Casual'),
  new Tag('Avant Garde'),
  new Tag('Minimalist'),
  new Tag('Street'),
  new Tag('Vintage'),
  new Tag('Luxury'),
  new Tag('Casual'),
  new Tag('Avant Garde'),
  new Tag('Minimalist'),
];

List<Collection> collectionItems = [
  new Collection(new User('불스아이', ('lib/assets/profile01.jpg'), [], [], [], [], productItems),'collection1', 'lib/assets/c1.png', productItems),
  new Collection(new User('제시', ('lib/assets/profile01.jpg'), [], [], [], [], wishList1),'collection2', 'lib/assets/c2.png', myItems1),
  //new Collection(new User('불스아이', AssetImage('lib/assets/profile01.jpg'), [], [], [], []), 'User Collection 1', productItems),
  ];

List<Product> productItems = [
  new Product('username','Product1', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product2', 'lib/assets/2.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product3', 'lib/assets/3.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product4', 'lib/assets/4.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product5', 'lib/assets/5.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/6.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/10.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/11.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product1', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product2', 'lib/assets/2.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product3', 'lib/assets/3.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product4', 'lib/assets/4.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product5', 'lib/assets/5.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/6.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/10.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/11.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product1', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product2', 'lib/assets/2.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product3', 'lib/assets/3.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product4', 'lib/assets/4.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product5', 'lib/assets/5.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/6.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/10.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/11.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product1', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product2', 'lib/assets/2.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product3', 'lib/assets/3.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product4', 'lib/assets/4.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product5', 'lib/assets/5.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/6.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/10.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product6', 'lib/assets/11.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
];

ProductLists productListItem = ProductLists(myItems1, recentView1, wishList1);


List<Product> myItems1 = [
  new Product('username','Product1', 'lib/assets/7.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
  new Product('username','Product2', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
  new Product('username','Product3', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
  new Product('username','Product4', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
  new Product('username','Product5', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
  new Product('username','Product6', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 2000),
];

List<Product> recentView1 = [
  new Product('username','Product11', 'lib/assets/8.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product12', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product13', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product14', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product15', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product16', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
];

List<Product> wishList1 = [
  new Product('username','Product21', 'lib/assets/9.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product22', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product23', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product24', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product25', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
  new Product('username','Product26', 'lib/assets/1.png', new Tag('Clothes'), new Tag('Top'), new Tag('Shirts'), 1000),
];

List<Review> reviewItems = [
  new Review(user, "sample review", 5, wishList1[0]),
  new Review(user, "sample review2", 5, wishList1[1]),
];

List<Tag> tagItems = [
  new Tag('tag1'),
  new Tag('tag2'),
  new Tag('tag3'),
  new Tag('tag4'),
  new Tag('tag5'),
  new Tag('tag6'),
  new Tag('tag7'),
  new Tag('tag8'),
  new Tag('tag9'),
  new Tag('tag10'),
  new Tag('tag11'),
  new Tag('tag12'),
  new Tag('tag13'),
  new Tag('tag14'),
  new Tag('tag15'),
  new Tag('tag16'),
  new Tag('tag17'),
  new Tag('tag18'),
];

List<Comment> commentItems = [
  new Comment(userList[0], 'comment', new DateTime.utc(2020, 6, 1), false),
  new Comment(userList[0], 'comment', new DateTime.utc(2020, 6, 1), false),
  new Comment(userList[0], 'comment', new DateTime.utc(2020, 6, 1), false),
  new Comment(userList[0], 'comment', new DateTime.utc(2020, 6, 1), false),
];

List<Product> empty = [];
