import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp()으로 감싼다.
    return MaterialApp(
      //debugShowCheckedModeBanner: false <<에뮬레이터에서 오른쪽 위에 생기는 리본 제거
      debugShowCheckedModeBanner: false,
      // 2. Scaffold() 뼈대를 만든다.
      home: StorePage(),
    );
  }
}

// 2. Scaffold() 뼈대를 만든다.
class StorePage extends StatelessWidget {
  StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Column << 세로 위젯
      body: SafeArea(
        child: Column(
          // children << List 타입
          children: [
            // Row << 가로 위젯
            Padding(
              // Inset << App이 사용할수 없는 영역
              // EdgeInsets.all() << 이름이 있는 생성자, 생성자 오버로딩 대신 사용
              padding: const EdgeInsets.all(25.0),
              // padding: const EdgeInsets.only(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Woman", style: TextStyle(fontWeight: FontWeight.bold)),
                  // Spacer() << 남는 공간을 다 잡아먹는 역할
                  Text("Kid", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Shoes", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bag", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              // yaml에서 assets를 정적폴더로 지정했기 때문에 바로 찾을수있음
              child: Image.asset(
                "assets/bag.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            // 플러터는 margin이 없다. 대신에 SizedBox를 써서 작은 공백을 만듬
            // SizedBox를 써서 height를 쓰면 가로, width를 쓰면 세로로 생긴다.
            SizedBox(
              height: 1,
            ),
            Expanded(
              child: Image.asset(
                "assets/cloth.jpeg",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
