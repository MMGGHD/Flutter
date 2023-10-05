import 'package:flutter/material.dart';

// 사용할 MaterialColor 객체를 만들어 준다.
// 원래는 My_color.dart파일을만들어서 재활용 해서 쓴다.
// 컨벤션은 const Color kBlue = Color(색상코드) << 처럼 k___ 로 쓴다.
const MaterialColor primaryWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFF0000),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

ThemeData theme() {
  return ThemeData(
    primarySwatch: primaryWhite,

    // const << 메모리에 한번 할당하고, 여러번 랜더링 할수있는 선언 키워드
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.blue),
    ),
  );
}
