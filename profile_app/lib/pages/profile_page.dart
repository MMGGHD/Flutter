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
        body: Expanded(child: ProfileTab()),
      ),
    );
  }
}
