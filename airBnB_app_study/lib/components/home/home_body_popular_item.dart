import 'package:airbnb_app_study/size.dart';
import 'package:flutter/material.dart';

class HomeBodyPopularItem extends StatelessWidget {
  final id;
  final poplarList = [
    "p1.jpeg",
    "p2.jpeg",
    "p3.jpeg",
  ];
  HomeBodyPopularItem({required this.id});

  @override
  Widget build(BuildContext context) {
    double popularItemWidth = getBodyWidth(context) / 3 - 5;

    return Padding(
      padding: const EdgeInsets.only(bottom: gap_xl),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 320,
        ),
        child: SizedBox(
          width: popularItemWidth,
          child: Column(
            children: [
              _buildPopularItemImage(),
              _buildPopularItemStar(),
              _buildPopularItemComment(),
              _buildPopularItemUserInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularItemImage() {
    return SizedBox();
  }

  _buildPopularItemStar() {
    return SizedBox();
  }

  _buildPopularItemComment() {
    return SizedBox();
  }

  _buildPopularItemUserInfo() {
    return SizedBox();
  }
}
