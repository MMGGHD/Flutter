import 'package:flutter/material.dart';

import '../components/logo.dart';
import '../size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("Care soft"),
            SizedBox(height: large_gap),
            TextButton(
                onPressed: () {
                  // pop << context에서 현재 페이지 정보를 제거
                  Navigator.pop(context);
                },
                child: Text("Get Started")),
          ],
        ),
      ),
    );
  }
}
