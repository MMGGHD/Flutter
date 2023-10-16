// 창고
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final bool isCompleted;
  final String description;
  Todo(this.isCompleted, this.description);
}

// To-do 클래스를 관리하는 todoProvider객체 생성
final todoProvider = Provider<Todo>((ref) {
  return Todo(true, "공부하기");
});
