import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

MaterialColor primaryWhite = MaterialColor(
  _primaryWhite,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_primaryWhite),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

const int _primaryWhite = 0xFFFFFFFF;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 테마는 여기서 결정
      // primarySwatch << primaryColor를 대신해서 쓴다, primary 색상을 지정한다.
      // primarySwatch << Colors가 아닌 materialColor를 인수로 가진다.
      // primary 색상과 대비되는 색상을 자동 지원한다.
      // 그냥 막 넣으면(Colors.White등) 오류남.
      theme: ThemeData(
        primarySwatch: primaryWhite,
        // primary색상과 다른 색상을 지정하려면 따로 Theme 설정을 해주면 된다.
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
        ),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 가장먼저 앱의 컨셉을 결정할 테마 색상을 정해야한다.
      // 테마는 MaterialApp()에서 정한다.
      appBar: AppBar(
        leading: Icon(
          Icons.back_hand,
        ),
        title: Text("안녕"),
      ),
      body: Center(
        child: Text("hello World"),
      ),
    );
  }
}
