import 'package:flutter/material.dart';

// Stateful 위젯은 특정 이벤트가 오면 Build메서드가 여러번 실행된다.
// class가 2개로 나뉜다.
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

// <<StatefulWidget 사용법>>

// 1. SingleTickerProviderStateMixin을 Composition해야한다.
// with << Composition(구성)코드
class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  // TabController << TabBar와 TabBarView를 연결하는 객체
  TabController? _tabController;

  // 오브젝트 초기화 메서드 << _ProfileTabState대고 Ctrl+O해서 오버라이드
  @override
  void initState() {
    super.initState();
    // length << TabBar 메뉴의 갯수
    // vsync << 다시 그려질 대상이 어떤것?
    // vsync로 그려질 대상에는 현재 클래스인 _ProfileTabState가 포함 << this키워드 사용함
    _tabController = TabController(length: 2, vsync: this);
    print("initState() 초기화 됨");
  }

  @override
  Widget build(BuildContext context) {
    // 테스트용 print
    print("빌드 다시 됨");
    return Column(
      children: [
        // TabBar의 tabs와 TabBarView의 children은 List 타입
        // TabBar의 크기는 아이콘의 크기만큼 잡힌다.
        TabBar(
          controller: _tabController,
          // tabs안에 Widget들어와야함 (타입이 List<Widget> tabs)
          tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
          ],
        ),
        // TabBarView의 Size가 잡히지않으면 오류발생
        // Expanded로 남은 공간을 다 채워주면 오류가 안생긴다.
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // GridView << ViewHolder패턴으로 작동
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 50,
                itemBuilder: (context, index) =>
                    Image.network("https://picsum.photos/id/${index}/200/200"),
              ),
              // Container(color: Colors.red),
              // Container(color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }
}
