import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  String title;
  RecipeTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Text를 감싼 Padding
      padding: const EdgeInsets.only(top: 20),
      child: Text(title, style: TextStyle(fontSize: 30)),
    );
  }
}
