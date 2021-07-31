// 25 July (SUN), 2021 Updated

/*

Front-End

App Title
Logo design
Branding
Renewal all of screen design

[ Hidden ]
- Admin page

[ Level 0 ]
- Splash
- Sign in

[ Level 1 ]
- Home
- Search
- Notification ?
- Profile

[ Level 2 ]
- Artist profile ( Level 1 Profile )
- Search result
- Setting
- Add artwork
- Artwork detail
- Order list

[ Level 3 ]
- Order artwork
- Order detail
- Order result
- General Setting
_ Profile Setting

*/

/*

Back-End

[ Hidden Level ]
Admin
- Send notification of order state

[ Level 0 ]
Splash
- Animation logo or image logo

Sign in & up
- Social Login with Google, Apple, Facebook, Kakao?

[ Level 1 ]
Home
- Exposure algorithm

Search
- Recent search keyword
- Autofill recommend

Notification
- Notify for order state from admin page

Profile
-

[ Level 2 ]
Artist profile
-

Search result
-

Setting
- General setting
- Profile setting

Add artwork
- Upload images to Firestore
- Upload details to Firebase

Artwork detail
- Navigate to Order

Order list
- Refresh in realtime

[ Level 3 ]
Order artwork
- Upload order detail to Firebase
- Notify order info to Administrator

Order detail
- Can be controlled by admin

Order result
- Successful or not

General Setting
-

Profile Setting
-

*/

/*
Data Structure

[User]
- user id
- nickname
- profile image
- bio
- artwork list
- order list
- name
- address

[Artwork]
- user id
- artwork id
- image list
- title
- description
- price

[Order]
- user id
- artwork id
- order id
- order state

[Notification]
- user id
- notification type
- message

[Shared Preference]
- login info
- cart
- order list

*/