import 'package:flutter/material.dart';

import 'models/component.dart';
import 'models/user.dart';
import 'models/appbar.dart';

TextStyle textStyle = new TextStyle(fontFamily: 'Gotham');
TextStyle textStyleBold = new TextStyle(fontFamily: 'Gotham', fontWeight: FontWeight.bold, color: Colors.black);
TextStyle textStyleLigthGrey = new TextStyle(fontFamily: 'Gotham', color: Colors.grey);

User follower1 = new User('the_rock', AssetImage('lib/assets/follower3.jpeg'), [], [], [], [], true);
User follower2 = new User('miley_cyrus', AssetImage('lib/assets/follower2.jpg'), [], [], [], [], false);
User follower3 = new User('kim_k', AssetImage('lib/assets/their_profile.jpeg'), [], [], [], [], true);
User follower4 = new User('daredevil', AssetImage('lib/assets/profile3.png'), [], [], [], [], true);
User follower5 = new User('batman', AssetImage('lib/assets/profile6.jpg'), [], [], [], [], true);
User follower6 = new User('peter_griffin', AssetImage('lib/assets/profile4.png'), [], [], [], [], false);

List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3, follower4, follower5, follower6], [
    new Comment(follower1, "This was amazing!", DateTime.now(), false),
    new Comment(follower2, "Cool one", DateTime.now(), false),
    new Comment(follower4, "This is no good at all \nbuddy, don't post this stuff", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/post2.jpg'), follower1, "This is such a great post though", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo4.jpg'), follower5, "How did I even take this photo??", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo5.jpg'), follower3, "Found this in my backyard. \nThought I'd post it jk lol lol lolol", DateTime.now(), [user, follower2, follower3, follower4, follower5], [
    new Comment(follower3, "This was super cool!", DateTime.now(), false),
    new Comment(follower1, "I can't believe it's not \nbutter!", DateTime.now(), false),
    new Comment(user, "I know rite!", DateTime.now(), false),
    new Comment(follower5, "I'm batman", DateTime.now(), false)
  ], false, false),

];

Post post1 = new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3], [], false, false);
final User user = new User('kallehallden', AssetImage('lib/assets/my_profile.jpg'), [
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
], [], [], false);

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
  new Collection('C Collection1'),
  new Collection('C Collection2'),
  new Collection('C Collection3'),
  new Collection('C Collection4'),
];