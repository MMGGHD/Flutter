import 'package:flutter_riverpod/flutter_riverpod.dart';

String data = "사과";

final fruitProvider = StateNotifierProvider<FruitStore, String>((ref) {
  return FruitStore(data);
});

class FruitStore extends StateNotifier<String> {
  FruitStore(super.state);

  void changeData() {
    state = "딸기";
  }
}
