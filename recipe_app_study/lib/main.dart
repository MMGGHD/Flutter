import 'package:flutter/material.dart';
import 'package:recipe_app_study/pages/recipe_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp 잡아주기
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme로 전체적인 스타일을 지정할수 있다.
      theme: ThemeData(fontFamily: "PatuaOne"),

      // RecipePage << AppBar 페이지
      // 화면 1개마다 class를 만든다.
      home: RecipePage(),
    );
  }
}
