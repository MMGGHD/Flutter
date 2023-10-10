import 'package:flutter/material.dart';

// main_copy 클래스 << HeaderPage()와 BottomPage()를 분리하였음
// HomePage(HeaderPage(), BottomPage())의 3개 클래스 구조로 나뉨
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// 숫자를 변경하려면 HeaderPage()는 StatefulWidget 위젯으로 상태를 가지게 해야한다.
// 하지만 BottomPage()은 StatelessWidget으로 setState를 사용할수 없다.
// 문제를 해결하려면 상태와 버튼의 공통부모를 Stateful로 만듬.
// 그리고 하위 위젯을 Stateless로 만들고, 부모로부터 변경값을 내려받기 한다.
// HomePage()를 Stateless에서 Stateful로 변환
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상태 값(변환 후 추가됨), 헤더에게 넘겨줌
  int num = 1;
  // 상태를 변경시키는 행위(변환 후 추가됨), 바텀에게 넘겨줌
  void add() {
    setState(() {
      num = num + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 상태 값과, 행위를 각각 전달
            // num() << 처럼메서드 전달할때 괄호붙이면 바로 실행됨
            Expanded(child: HeaderPage(num)),
            Expanded(child: BottomPage(add)),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  final num;

  HeaderPage(this.num);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "${num}",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  final add;
  BottomPage(this.add);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            print("버튼 클릭됨");
            add();
          },
          child: Text(
            "증가",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}
