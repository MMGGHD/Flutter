import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();
// JUnit과 다르게 매개변수를 전달할수 있다.
void main() async {
  await fetchUserList_test();
}

// 일반 객체 요청
// fetch함수는 뭐라도 return해야 하기 때문에 Future타입을 가진다.
Future<User> fetchUser_test() async {
  // dynamic는 일반객체, Map을 감싸는 List타입의 두가지를 받을수있다.
  // 그래서 response.data객체를 일단 dynamic 타입으로 받는다.
  Response<dynamic> response = await dio.get("http://localhost:8080/user/1");
  // Response<dynamic> 대신에 final로 퉁쳐도된다.
  final response2 = await dio.get("http://localhost:8080/user/1");
  print("response 1 : ${response}, response2 : ${response2}");

  // 받은 response.data를 알맞은 타입(객체이므로 Map타입)으로 다운캐스팅
  Map<String, dynamic> body = response.data as Map<String, dynamic>;
  print(body["username"]);

  User user = User.fromJson(body);
  return user;
}

// List 객체 요청
Future<List<User>> fetchUserList_test() async {
  // dynamic는 일반객체, Map을 감싸는 List타입의 두가지를 받을수있다.
  // 그래서 response.data객체를 일단 dynamic 타입으로 받는다.
  Response<dynamic> response = await dio.get("http://localhost:8080/user");
  // response.data << List안에 Map이 들어가있는 타입
  print(response.data);

  // 받은 response.data를 알맞은 타입(리스트이므로 List<>타입)으로 다운캐스팅
  // 먼저 List<dynamic>타입으로 다운캐스팅함 (dynamic은 정확하게는 Map타입)
  // 다음에 Stream으로 fromJson처리해서 List<User>에 담아준다.
  List<dynamic> bodyList = response.data as List<dynamic>;
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
  print(userList[0].username);

  return userList;
}
