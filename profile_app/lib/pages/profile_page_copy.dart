import 'package:flutter/material.dart';
import 'package:profile_app/components/profile_count_info.dart';
import 'package:profile_app/components/profile_drawer.dart';

import '../components/profile_buttons.dart';
import '../components/profile_header.dart';
import '../components/profile_tab.dart';

class ProfilePageCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ProfileDrawer(),
      body: CustomScrollView(
        slivers: [
          // builder는 갯수를 동적으로 넣을수 있다.
          SliverAppBar(
            leading: Icon(Icons.arrow_back_ios),
            title: Text("Profile"),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileHeader(),
                ProfileCountInfo(),
                ProfileButtons(),
              ],
            ),
          ),
          // Sliver에서 Expanded는 무한대가 되기 때문에 못쓴다.
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: ProfileTab(),
            ),
          ),
        ],
      ),
    );
  }
}
