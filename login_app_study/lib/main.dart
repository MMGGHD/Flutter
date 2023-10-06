import 'package:flutter/material.dart';
import 'package:login_app_study/pages/home_page.dart';
import 'package:login_app_study/pages/join_page.dart';
import 'package:login_app_study/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 페이지가 여러개면 routes가 필요함
  // routes는 Map(key, value)타입
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // buildThemeData() << 버튼의 테마를 지정
      theme: buildThemeData(),
      // initialRoute << Body가 없는 대신 처음 접속하면 나오는 화면지정
      initialRoute: "/join",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/join": (context) => JoinPage(),
      },
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      // 버튼의 테마를 지정
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: Size(double.infinity, 60)),
      ),
    );
  }
}
