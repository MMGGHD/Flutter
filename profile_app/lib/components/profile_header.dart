import 'package:flutter/material.dart';

// ProfileHeader << 왼쪽에 아바타, 오른쪽에는 글자(Colume)
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        // _(언더바) 는 private키워드와 같은역할
        _buildHeaderAvatar(),
        SizedBox(width: 20),
        _buildHeaderProfile(),
      ],
    );
  }
}

// Widget은 모든 요소의 부모이다. 그래서 return으로 SizedBox를 받아도됨
// _buildHeader~ 위젯은 사용처가 한정적이라서 클래스(컴퍼넌트)로 안빼고 메서드로 뺀다.
// 대부분 컴퍼넌트로 빼는것이 낫다. (메서드로 빼는경우는 거의 없다)
Widget _buildHeaderAvatar() {
  return SizedBox(
    width: 100,
    height: 100,
    // CircleAvatar 자체는 Size조절 파라미터를 가지고 있지 않다
    // 이렇게 Size조절이 없는 위젯의 경우 SizedBox로 감싸 크기를 조정한다.
    child: CircleAvatar(
      backgroundImage: AssetImage("assets/avatar.png"),
    ),
  );
}

Widget _buildHeaderProfile() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Getinthere",
        style: TextStyle(
            fontSize: 25,
            // FontWeight.w~ << 폰트의 진한 정도
            fontWeight: FontWeight.w700),
      ),
      Text(
        "프로그래머",
        style: TextStyle(fontSize: 20),
      ),
      Text(
        "메타코딩",
        style: TextStyle(fontSize: 15),
      ),
    ],
  );
}
