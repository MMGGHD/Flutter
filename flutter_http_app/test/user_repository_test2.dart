import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

// BaseOptions(baseUrl) << Prefix역할
final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.51:8080"));
void main() async {
  await fetchUserList_test();
}

Future<User> fetchUser_test() async {
  Response<dynamic> response = await dio.get("/user/1");
  final response2 = await dio.get("/user/1");
  print("response 1 : ${response}, response2 : ${response2}");

  Map<String, dynamic> body = response.data as Map<String, dynamic>;
  print(body["username"]);

  User user = User.fromJson(body);
  return user;
}

// List 객체 요청
Future<List<User>> fetchUserList_test() async {
  Response<dynamic> response = await dio.get("/user");
  print(response.data);

  List<dynamic> bodyList = response.data as List<dynamic>;
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();
  print(userList[0].username);

  return userList;
}
