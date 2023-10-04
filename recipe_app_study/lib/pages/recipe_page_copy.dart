import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          maxWidth: double.infinity,
          minHeight: double.infinity,
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Container(
          width: 50,
          height: 30,
          color: Colors.red,
          constraints: BoxConstraints(
            minWidth: 50,
            maxWidth: 50,
            minHeight: 50,
            maxHeight: 50,
          ),
          child: SizedBox(
            width: 30,
            height: 30,
            // color: Colors.blue,
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 15),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 15),
      ],
    );
  }
}
