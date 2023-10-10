import 'package:flutter/material.dart';

import 'appbar/first_appbar.dart';
import 'appbar/third_appbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body를 AppBar뒤까지 확장해 준다.
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Image.network(
            "https://picsum.photos/id/${index + 50}/200/300",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
