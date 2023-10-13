import 'package:dio/dio.dart';

final dio = Dio();

void main() async {
  await getHttp();
}

Future<void> getHttp() async {
  print("0");
  final response = await dio.get('http://localhost:8080/user');
  print("1");
  print(response);
  print("2");
}
