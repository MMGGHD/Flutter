import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 컨트롤러 생성
  final ScrollController _controller = ScrollController();
  double prev = 0;
  double height = 300;

  // 컨트롤러에 리스너를 장착
  @override
  void initState() {
    _controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  void scrollListener() {
    print("스크롤 동작중");
    // Offset << 스크롤바의 현재 위치
    // 스크롤이 가장 높이 있을때 currentOffset = 0
    // Offset의 현재보다 작아지면 스크롤바가 올라간것이다.
    // Offset의 이전과 현재값을 비교하기 위해 저장할 변수가 필요하다. (prev, next)
    double currentOffset = _controller.offset;
    print("currentOffset : ${currentOffset}");

    // 실습
    if (currentOffset < 300 && height >= 0) {
      if (currentOffset > prev) {
        print("스크롤 아래로 이동중");
        setState(() {
          height = height - (currentOffset - prev);
          print("height : ${height}");
        });
      }

      if (currentOffset < prev) {
        print("스크롤 위로 이동중");
        setState(
          () {
            height = height + (prev - currentOffset);
            print("height : ${height}");
          },
        );
      }
    }

    // 스크롤 동작중 위치비교 로직
    // position.maxScrollExtent << 컨트롤러가 갈수있는 최저점을 구하는 메서드
    if (currentOffset == _controller.position.maxScrollExtent) {
      setState(() {
        height = 0;
      });
      print("가장 하단");
    }
    // position.minScrollExtent << 컨트롤러가 갈수있는 최저점을 구하는 메서드
    if (currentOffset == _controller.position.minScrollExtent) {
      setState(() {
        height = 300;
      });
      print("가장 상단");
    }

    // 스크롤 동작이 끝나면 currentOffset는 이전값이 되어 prev에 담긴다.
    prev = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(255, 0, 0, 1 / 300 * height),
              height: height,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Good",
                  style: TextStyle(
                      color: Colors.white, fontSize: (50 / 300 * height + 20)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                // ListView에 컨트롤러를 장착 << 스크롤의 움직임을 감지해준다.
                controller: _controller,
                itemCount: 50,
                itemBuilder: (context, index) => Text("제목 $index"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
