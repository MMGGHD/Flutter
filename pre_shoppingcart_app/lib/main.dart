import 'package:flutter/material.dart';

// Shopping Cart 프로젝트 << 여기서 예제 2개 연습하고 들어갈것
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

// StatefulWidget << 클릭하고 Alt+Enter하면 StatelessWidget으로 전환할수있다.
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  // createState()가 상태 변경시마다 실행됨
  @override
  State<MyPage> createState() {
    print("1. createState()");
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  // StatelessWidget의 위젯은 final
  // StatefulWidget만 동적으로 선언할수 있다.
  // int num << 상태 관리변수
  int num = 1;

  // _MyPageState객체가 최초 실행될때 그림을 그려주는 메서드
  // 상태가 변경될때는 실행되지 않는다.
  @override
  void initState() {
    print("3. initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("2. _MyPageState build()");
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: Text(
                "${num}",
                style: TextStyle(fontSize: 50),
              )),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // num = num + 1;
                    print("num 값 증가됨 : ${num}");
                    // onPressed 마다 num값은 증가함
                    // 즉 build(BuildContext context) 메서드가 실행되지 않았다
                    // createState()에서 _MyPageState()가 리턴되지않았다.
                    // setState()가 없으면 갱신되지 않는다.
                    // setState() << State클래스가 들고있는 자기자신을 ReBuild하는 함수
                    setState(() {});
                  },
                  child: Text(
                    "증가",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
