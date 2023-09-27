import 'package:flutter/material.dart';
import 'package:recipe_app_study/components/recipe_menu_icon.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // RecipeMenuIcon Container를 가지는 위젯
        // Container << div처럼 빈 박스
        // 모든 요소는 child, children을 가질수 있다.
        // 영역을 확인하려면 Flutter Inspection에서 확인
        // Row-children[] 밖에 있으면 width가 조정되지 않는다.
        RecipeMenuIcon(Icons.food_bank, "All"),
        SizedBox(width: 25),
        RecipeMenuIcon(Icons.emoji_food_beverage, "coffce"),
        SizedBox(width: 25),
        RecipeMenuIcon(Icons.fastfood, "Burger"),
        SizedBox(width: 25),
        RecipeMenuIcon(Icons.local_pizza, "Pizza")
      ],
    );
  }
}
