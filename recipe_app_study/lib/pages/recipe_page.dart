import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/recipe_list_item.dart';
import '../components/recipe_menu.dart';
import '../components/recipe_title.dart';

// 페이지를 만든것이다.
// package:flutter/material.dart'; 를 임포트
class RecipePage extends StatelessWidget {
  RecipePage({super.key});

  // fetch 함수로 데이터를 받았을때 밑에서 map으로 뿌린다.
  // List<String> fetch() {
  //   return ["coffee", "burger", "pizza"];
  // }

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
        // ListView면 스크롤이 생기지만, Column이면 화면을 넘기지 않음
        // ListView면 하위 요소의 가로 끝까지 범위가 잡힌다.
        // Column이면 하위 요소 크기만큼 범위가 잡히고, 가운데 정렬이 된다.
        // 이들의 하위 속성은 부모(ListView, Column등)의 제약조건을 따른다.
        child: ListView(
          children: [
            // fontFamily << 폰트설정이지만 단일 개체에만 적용됨 (다수 적용에 테마를 사용)
            RecipeTitle("Recipes"),
            SizedBox(height: 10),
            RecipeMenu(),
            // RecipeListItem()에서 달라야하는것 Name, title, padding << 매개변수로준다.
            RecipeListItem(imageName: "coffee", title: "coffee"),
            RecipeListItem(imageName: "burger", title: "burger"),
            RecipeListItem(imageName: "pizza", title: "pizza"),
            // fetch로 받은 List를 Stream의 map을 써서 뽑아내는 방법
            // fetch().map((e) => RecipeListItem(imageName: e, title: title)).toList(),
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
