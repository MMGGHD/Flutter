import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// 매개변수로 Title 받아야함
class Logo extends StatelessWidget {
  String title;
  Logo(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 라이브러리를 이용한 Svg추가하기
        SvgPicture.asset("assets/logo.svg", width: 70, height: 70),
        Text(
          "${title}",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
