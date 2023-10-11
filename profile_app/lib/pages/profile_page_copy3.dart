import 'package:flutter/material.dart';
import 'package:profile_app/components/profile_count_info.dart';
import 'package:profile_app/components/profile_drawer.dart';

import '../components/profile_buttons.dart';
import '../components/profile_header.dart';
import '../components/profile_tab.dart';

void main() => runApp(MaterialApp(
      home: ProfilePageCopy3(),
    ));

class ProfilePageCopy3 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ProfilePageCopy3> {
  var top = 0.0;
  String title = "Good";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              title: Text(
                "$title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              // LayoutBuilder << 로직을 짜기 전에 크기를 알기위해 사용하는 위젯
              // 조건에 맞는 로직(if, else문 등)을 작성해서 레이아웃을 동적으로 변경가능
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // 계산하려면 다양한 기본값들을 알고있어야 한다.
                // MediaQuery.of(context).padding.top << Inset영역의 높이 : 24
                // 56 << Appbar가 기본적으로 가지고있는 높이 (나중에 변경가능)
                // 16 << Appbar 좌우 기본여백 넓이
                // MediaQuery << 컨텍스트에서 정보를 질의하는 클래스
                double size = MediaQuery.of(context).padding.top + 56;
                // LayoutBuilder의 constraints << 현재 박스의 크기를 구하는 메서드 제공
                top = constraints.biggest.height;
                print("탑 패딩 : ${MediaQuery.of(context).padding.top}");
                if (size == top) {
                  print("슬리버 사라짐");
                }
                return FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      // top.toString() << 현재 높이를 출력
                      top.toString(),
                      style: TextStyle(fontSize: 12.0),
                    ),
                    background: Image.network(
                      "https://images.unsplash.com/photo-1542601098-3adb3baeb1ec?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=5bb9a9747954cdd6eabe54e3688a407e&auto=format&fit=crop&w=500&q=60",
                      fit: BoxFit.cover,
                    ));
              })),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("List Item: " + index.toString());
        },
      ),
    ));
  }
}
