import 'package:flutter/material.dart';

class RecipeMenuIcon extends StatelessWidget {
  IconData mIcon;
  String text;
  RecipeMenuIcon(this.mIcon, this.text);

  // Container << div처럼 빈 박스
  // 모든 요소는 child, children을 가질수 있다.
  // 영역을 확인하려면 Flutter Inspection에서 확인
  // Row-children[] 밖에 있으면 width가 조정되지 않는다.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // Border.all << 모든 영역에 Border를 주겠다.
        border: Border.all(color: Colors.black12),
      ),
      // color: Colors.redAccent,
      child: Column(
        // Column의 mainAxisAlignment 방향으로 정렬하는 속성
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon과 Text를 매개변수로해서 위젯으로 추출할수 있다.
          Icon(mIcon, size: 30, color: Colors.redAccent),
          SizedBox(height: 5),
          Text(text, style: TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
