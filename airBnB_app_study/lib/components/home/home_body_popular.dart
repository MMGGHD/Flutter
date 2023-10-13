import 'package:airbnb_app_study/components/home/home_body_popular_item.dart';
import 'package:airbnb_app_study/size.dart';
import 'package:flutter/material.dart';

class HomeBodyPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPopularTitle(),
          _buildPopularList(),
        ],
      ),
    );
  }

  Widget _buildPopularTitle() {
    return SizedBox();
  }

  _buildPopularList() {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Wrap(
        children: [
          HomeBodyPopularItem(id: 0),
          SizedBox(width: 7.5),
          HomeBodyPopularItem(id: 1),
          SizedBox(width: 7.5),
          HomeBodyPopularItem(id: 2),
        ],
      ),
    );
  }
}
