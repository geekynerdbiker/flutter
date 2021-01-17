import 'package:bak/models/classes/user.dart';
import 'package:bak/models/components/border.dart';
import 'package:bak/models/components/navigation.dart';
import 'package:bak/models/designs/colors.dart';
import 'package:bak/models/designs/icons.dart';
import 'package:bak/pages/setting/editPhoneNumber.dart';
import 'package:bak/pages/setting/notificationSettiong.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingPage extends StatelessWidget {
  User user;

  SettingPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultDeep(context, '설정'),
      body: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          accountSetting(context),
          functionSetting(context),
          tradeSetting(context),
          serviceInfo(context),
        ],
      ),
    );
  }

  Widget accountSetting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: light,
          child: Text("계정 설정"),
        ),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhoneNumber(user: user,)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text("연락처 변경"),
            ),
          ),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("취향 관리"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("로그아웃"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("회원탈퇴"),
        ),
      ],
    );
  }

  Widget functionSetting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: light,
          child: Text("기능 설정"),
        ),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => NotificationSetting(user: user,)));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("알림 설정"),
                  ImageIcon(AssetImage(forward_idle), size: 12,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tradeSetting(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: light,
          child: Text("거래 설정"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("배송지 설정"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("계좌 설정"),
        ),
      ],
    );
  }

  Widget serviceInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: light,
          child: Text("서비스 정보"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("공지사항"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("개인정보처리방침"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("정책"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("이용약관"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("Q&A"),
        ),
        borderLineGreyLite(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text("버전 정보"),
        ),
        borderLineGreyLite(context),
      ],
    );
  }
}
