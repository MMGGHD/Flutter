import 'package:flutter/material.dart';

class ProfileCountInfo extends StatelessWidget {
  const ProfileCountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // 메서드로 추출할때 _xxx로(= private로) 뺀다는 것은 여기서만 사용한다는 의미
        _buildInfo("50", "Posts"),
        _buildLine(),
        _buildInfo("10", "Likes"),
        _buildLine(),
        _buildInfo("3", "Share"),
      ],
    );
  }

  // 메서드로 추출할때 _xxx로(= private로) 뺀다는 것은 여기서만 사용한다는 의미
  Widget _buildLine() {
    return Container(
      width: 2,
      height: 60,
      color: Colors.blue,
    );
  }

  Widget _buildInfo(String count, String title) {
    return Column(
      children: [
        Text("$count", style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 2),
        Text("$title", style: const TextStyle(fontSize: 15)),
      ],
    );
  }
}
