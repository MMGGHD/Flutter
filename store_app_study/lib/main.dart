import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStudy(),
    );
  }
}

class MyStudy extends StatelessWidget {
  const MyStudy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Women"),
                  Text("Kid"),
                  Text("Shoes"),
                  Text("Bag"),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/bag.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Expanded(
              child: Image.asset(
                'assets/cloth.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
