import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("HomePage")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
// pushNamed << 라우터 주소를 직접 설정해야 하는 이동
// push << 페이지 클래스를 적고 new해서 이동(동적임)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(),
            ),
          );
        },
        child: Text("move"),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// appBar에는 기본적으로 뒤로가기 기능이 아이콘으로 구현되어있다.
      appBar: AppBar(),
      body: Center(
        child: Text("SecondPage"),
      ),
    );
  }
}
