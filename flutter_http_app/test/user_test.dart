// JUnit과 유사
import 'package:flutter_http_app/model/user.dart';

void main() {
  // 1. User 객체 만들기
  User u1 =
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
  print(u1.username);

  // 2. User Map 타입 만들기
  Map<String, dynamic> u2 = {
    "id": 2,
    "username": "cos",
    "password": "1234",
    "email": "cos@nate.com"
  };
  print(u2["username"]);

  // 3. Map타입을 DartObject로 변환 (수신할때)
  User u3 = User.fromJson(u2);
  print(u3.username);

  // 4. DartObject를 Map타입으로 (송신할때)
  Map<String, dynamic> u4 = u3.toJson();
  print(u4["username"]);
}
