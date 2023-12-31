// Flutter에서 Repository는 DB가 아닌 Spring과 연결됨

import 'package:flutter_http_app/model/user.dart';

class UserRepository {
  // 통신하기 위한 메서드
  User fetchUser(int id) {
    // 1. 통신 코드가 필요
    // 2. 통신으로 받은 데이터 타입(Map)
    // 3. Map >> Object
    // 4. return Object
    return User(
        id: 1, username: "ssar", password: "1234", email: "ssar@nate.com");
  }

  List<User> fetchUserList() {
    // 1. 통신 코드가 필요
    // 2. 통신으로 받은 데이터 타입(Map)
    // 3. Map >> Object
    // 4. return Object
    List<User> userList = [
      User(id: 1, username: "ssar", password: "1234", email: "ssar@nate.com"),
      User(id: 2, username: "cos", password: "1234", email: "cos@nate.com"),
      User(id: 3, username: "love", password: "1234", email: "love@nate.com")
    ];
    return userList;
  }
}
