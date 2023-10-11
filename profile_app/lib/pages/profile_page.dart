import 'package:flutter/material.dart';
import 'package:profile_app/components/profile_count_info.dart';
import 'package:profile_app/components/profile_drawer.dart';

import '../components/profile_buttons.dart';
import '../components/profile_header.dart';
import '../components/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 있으면 SafeArea로 감싸지 않아도 알아서 영역을 잡아준다.
      appBar: AppBar(
        // leading << AppBar 왼쪽의 화살표 아이콘
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Profile"),
        // centerTitle << center를 정렬할까요??
        centerTitle: true,
      ),
      // NestedScrollView << 스크롤 내부의 스크롤 구현해주는 스크롤
      // SliverView는 Sliver끼리 스크롤을 공유할수 있다.
      // SliverView는 Sliver가 아닌 다른 스크롤 위젯과 상호작용하지 못한다.
      // 따라서 ProfileTab()과 같은 클래스를 땡겨와서 쓸때는 SliverView를 쓸수 없다.
      // 이럴때 NestedScrollView로 내부 스크롤을 구현한다.
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ProfileHeader(),
                  ProfileCountInfo(),
                  ProfileButtons(),
                ],
              ),
            ),
          ];
        },
        // body << header를 처리하고 화면에 남는 공간
        // Sliver에서 SliverFillRemaining과 같은 역할
        body: Expanded(child: ProfileTab()),
      ),
    );
  }
}
