import 'package:flutter/material.dart';
import 'package:profile_app/pages/profile_page_copy.dart';
import 'package:profile_app/theme.dart';

import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // build << 실행될때마다 그림이 다시 그려짐 = StatelessWidget
  // 그림이 동적으로 바뀌는 Widget = StatefullWidget
  @override
  Widget build(BuildContext context) {
    // main의 셋팅은 항상 MaterialApp(), theme(), home()
    return MaterialApp(
      theme: theme(),
      // home안에 ProfilePage, 안에 Scafford()
      home: ProfilePageCopy(),
    );
  }
}
