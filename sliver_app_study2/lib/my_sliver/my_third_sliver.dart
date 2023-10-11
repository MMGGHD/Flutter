import 'package:flutter/material.dart';

class MyThirdSliver extends StatelessWidget {
  const MyThirdSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // slivers 내부에는 sliver타입만 들어올수 있다.
      slivers: [
        SliverAppBar(
          title: Text("SliverAppbar"),
          // expandedHeight << flexibleSpace가 사용할 높이
          expandedHeight: 200,
          // FlexibleSpaceBar << 스크롤이 넘어가며 서서히 사라지게 하는 효과
          // collapseMode를 통해 여러가지 옵션을 부여할수 있다.
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // SliverToBoxAdapter << 위젯을 Sliver타입으로 변환해주는 클래스
        // child를 통해 Sliver에서 Container등을 사용할수 있게 해준다.
        // 수평 스크롤 가능한 ListView
        SliverToBoxAdapter(
          child: SizedBox(
            // ListView의 높이 설정
            height: 150, //
            child: ListView.builder(
              // scrollDirection << 스크롤의 방향을 설정할수 있다.
              // scrollDirection을 사용하려면 ListView를 써야 한다.
              // 따라서 Sliver에서 쓰려면 SliverToBoxAdapter를 사용해야함.
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text("Horizontal Item $index"),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            // Viewholder 패턴으로 동작
            childCount: 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                  child: Text("${index}"),
                ),
              );
            },
          ),
        ),
        // SliverFillViewport << 화면을 꽉 채우는 크기의 SliverView
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return Card(
                child: Container(
                  child: Text("Fill ViewPort Item ${index}"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
