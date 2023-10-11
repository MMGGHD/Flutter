import 'package:flutter/material.dart';

class MySecondSliver extends StatelessWidget {
  const MySecondSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // slivers 내부에는 sliver타입만 들어올수 있다.
      slivers: [
        // SliverToBoxAdapter << 위젯을 Sliver타입으로 변환해주는 클래스
        // child로 Container등을 사용할수 있게 해준다.
        SliverToBoxAdapter(
          child: Container(
            height: 500,
            color: Colors.red,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            // Viewholder 패턴으로 동작
            childCount: 5,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(height: 100, color: Colors.blue),
              );
            },
          ),
        ),
      ],
    );
  }
}
