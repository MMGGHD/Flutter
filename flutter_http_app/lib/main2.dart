import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository2.dart';

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
    return Scaffold(
      // FutureBuilder를 써야 통신이 끝나는 타이밍을 snapshot으로 제공할수있음
      body: FutureBuilder<List<User>>(
        // future << 서버에 데이터를 요청하고 결과를 가지고있음
        future: UserRepository2().fetchUserList(),
        // future가 return하는 결과를 snapshot으로 던짐
        builder: (context, snapshot) {
          print("그림 그려짐");
          // snapshot이 데이터를 가지고있다 = 통신끝, 실제 그림을 return
          if (snapshot.hasData) {
            // 통신이 끝나도 가지고온 데이터가 null일수도 있다.
            List<User> userList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
                );
              },
            );
          }

          // snapshot이 데이터를 가지고 있지 않다. = 통신 하는 중
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
