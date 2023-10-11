import 'package:airbnb_app_study/components/home/home_body_banner.dart';
import 'package:airbnb_app_study/components/home/home_body_popular.dart';
import 'package:airbnb_app_study/size.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyWidth = getBodyWidth(context);
    return Align(
      child: SizedBox(
        width: bodyWidth,
        child: Column(
          children: [
            HomeBodyBanner(),
            HomeBodyPopular(),
          ],
        ),
      ),
    );
  }
}
