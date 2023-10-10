import 'package:flutter/material.dart';
import 'package:shoppingcart_app_stuby/constants.dart';

MaterialColor kPrimaryColor = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
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

// 전체 색감을 결정하는 theme클래스와 메서드
ThemeData theme() {
  return ThemeData(
    primarySwatch: kPrimaryColor,
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
