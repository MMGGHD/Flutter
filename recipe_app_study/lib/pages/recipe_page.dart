import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 페이지를 만든것이다.
// package:flutter/material.dart'; 를 임포트
class RecipePage extends StatelessWidget {
  RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 먼저 Scaffold 구조를 잡는다.
    // AppBar를 만들것
    return Scaffold(
      appBar: _appBar(),
      // ListView << 리스트이므로 자식이 여러개이므로 children을 사용
      body: Padding(
        // ListView를 감싼 Padding (지정하고 Alt+Enter)
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            // fontFamily << 폰트설정이지만 단일 개체에만 적용됨 (다수 적용에 테마를 사용)
            Padding(
              // Text를 감싼 Padding
              padding: const EdgeInsets.only(top: 20),
              child: Text("Recipes", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }

  // 하드코딩하고나서 메서드나 컴포넌트들을 끄집어 낸다 << 가독성, 재사용성 향상
  AppBar _appBar() {
    return AppBar(
      // 색상을 일일히 바꾸는 방법, 나중에는 이거 대신 테마를 쓴다.
      backgroundColor: Colors.white,
      // elevation << 붕 떠있는 느낌, 기본적 그림자 효과.
      elevation: 1.0,
      // actions << 배열이다.
      actions: [
        // Icon() << Icon 타입이 들어감
        // Icon, Icons 두가지 타입이 존재
        // 하지만 안예뻐서 Cupertino Icon 쓸것
        // CupertinoIcons.~~ << 안보인다면 배경색과 겹쳐서 그런것
        Icon(CupertinoIcons.search, color: Colors.black),
        // 아이콘 간격을 벌리기 위한 SizedBox()
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 15),
      ],
    );
  }
}
