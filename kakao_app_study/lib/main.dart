import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// <<Buttom Navigation Bar 실습>>

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar는 IndexedStack과 같이 쓴다.
      body: IndexedStack(
        // index << IndexedStack의 번호를 결정하는 상태 변수 (0부터)
        index: _selectedIndex,
        children: [
          Center(child: Text("IndexedStack1", style: TextStyle(fontSize: 30))),
          Center(child: Text("IndexedStack2", style: TextStyle(fontSize: 30))),
        ],
      ),
      // bottomNavigationBar를 만드는 화면은 상태관리가 반드시 들어감
      // StateFulWidget이어야 한다.
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex << 현재 선택된 인덱스 값을 내비게이션에게 알려줌
        currentIndex: _selectedIndex,
        // show(Un)SelectedLabels << 레이블 띄우기 유무 결정
        // false로 하지 않으면 아이콘의 위치가 다를수 있다. (false로 만들고 작업)
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // (un)selectedItemColor << 선택여부에 따라 레이블 색깔주기
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        // onTap(value) << 터치했을때 이벤트 발생하는 메서드
        // value << 클릭된 요소 인덱스값이 들어오는 매개변수 자리, index와 연동
        onTap: (value) {
          print("선택된 바텀 메뉴 ${value}");
          setState(() {
            _selectedIndex = value;
          });
        },
        // items에 바텀 네비게이션바에 들어갈 요소 정의
        // 최소 2개, 최대 5개, 매개변수로 Lable이 무조건 들어가야함
        // Lable은 BottomNavigationBar 하위의 매개변수로 설정 바꿀수 있음
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
