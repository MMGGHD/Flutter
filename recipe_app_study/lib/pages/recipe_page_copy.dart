import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipePageCopy extends StatelessWidget {
  RecipePageCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        constraints: BoxConstraints(
          minWidth: 10,
          maxWidth: double.infinity,
          minHeight: 10,
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Container(
            color: Colors.blue,
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: 300,
              minHeight: 0,
              maxHeight: 100,
            ),
            child: SizedBox(
              height: 100,
              width: 200,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 75,
                    maxWidth: 75,
                    minHeight: 75,
                    maxHeight: 75,
                  ),
                  width: 50,
                  height: 150,
                  color: Colors.amber,
                  child: Center(
                    child: Container(
                      color: Colors.black,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
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
