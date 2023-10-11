import 'package:flutter/material.dart';

class MyFirstSliver extends StatelessWidget {
  const MyFirstSliver({
    super.key,
  });

// Sliver를 쓰게 되는 이유
// ListView에는 Children의 크기가 고정된것, 동적으로 바뀌는(래핑되는)것 2가지 종류가있다.
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 500,
          color: Colors.red,
        ),

        //// 아래 코드는 height가 무한이 된다.
        //// 따라서 BoxConstraints forces an infinite height. 오류가 발생
        // Container(
        //   height: double.infinity,
        //   color: Colors.blue,
        // ),

        //// ListView내부의 ListView는 크기를 지정해 주어야 한다.
        //// 동적으로 내부요소가 얼마나 들어가는지 알수 없기 때문에 매번 크기 지정 필요
        //// 지정 않으면 Vertical viewport was given unbounded height. 오류 발생
        // ListView.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       height: 100,
        //       color: Colors.blue,
        //     );
        //   },
        // ),
        SizedBox(
          height: 525,
          child: ListView.builder(
            // NeverScrollableScrollPhysics << 리스트뷰의 스크롤 동작 금지
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
