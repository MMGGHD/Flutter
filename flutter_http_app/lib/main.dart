import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

// 유저 목록 뿌리기
class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return전에 Repository에서 데이터를 받아와야함

    // 실제 통신에서 이렇게 되면 출력안됨 << main2의 방식을 이용
    UserRepository ur = UserRepository();
    List<User> userList = ur.fetchUserList();

    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${userList[index].id}"),
            title: Text("${userList[index].username}"),
            subtitle: Text("${userList[index].email}"),
          );
        },
      ),
    );
  }
}
