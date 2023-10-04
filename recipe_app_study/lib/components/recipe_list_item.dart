import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  // 매개변수로 받아야하는것 image와 title, paddingValue
  String imageName;
  String title;
  double paddingValue;

  // 반드시 있어야 하는 것 << 선택적 매개변수 안쓰고 required
  // paddingValue << 기본값 20, required가 필요없다.
  RecipeListItem(
      {required this.imageName, required this.title, this.paddingValue = 20});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clip R(모서리) Rect 잘라준다. << 모서리 둥글게 잘라준다.
          // ClipOval << 모서리 타원으로 둥글게 (radius 필요 X)
          ClipRRect(
            // Image.asset("assets/images/coffee.jpeg",width: xx,height: yy,)
            // 이미지는 직접 크기를 지정하면 좋지 않다.
            // 넓이는 double infinity로 잡아도 높이를 잡기가 어렵기 때문
            // AspectRatio()로 감싸서 크기를 조정하는것이 좋다.
            // AspectRatio() << 넓이 : 높이의 정수 비율(aspectRatio)을 가진다.
            // aspectRatio가 2 / 1 이라면 넓이:높이 2:1의 비율이라는 뜻이다.
            child: AspectRatio(
              // 화면 넓이에 따라서 높이를 조절하는 비율, 정수값 연산으로 표현됨
              aspectRatio: 2 / 1,
              child: Image.asset(
                // BoxFit.cover는 사진 비율에 맞춤
                // BoxFit.fill 사진을 잘라 화면비율에 맞춤
                fit: BoxFit.cover,
                // "assets/images/coffee.jpeg",
                "assets/images/${imageName}.jpeg",
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          // 공백용 SizedBox
          SizedBox(height: 10),
          Text(
            "made ${title}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Have you ever made your own ${title}? Once you've tried a homemade ${title}. you'll never go back.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
