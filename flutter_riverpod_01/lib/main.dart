import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_01/todo.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(),
    );
  }
}

// ConsumerWidget를 extends해서 Provider에 접근 가능
class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  // WidgetRef를 통해 Provider가 관리하는 상태(데이터)에 접근이 가능
  // Provider는 상태가 변경될수 없기 때문에 ref.read()로 접근
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Todo todo = ref.read(todoProvider);
    return Scaffold(
      body: Center(
        child: Text(
          "완료 : ${todo.isCompleted}, 내용 : ${todo.description}",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
