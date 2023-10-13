// Model 클래스 << 서버로 부터 받을 데이터를 정의
// 서버측의 테이블과 동일하게 만들면 됨 (DTO와 다른개념)

// Dart에서 DTO를 받으면 Map타입(dynamic)으로 받아진다.
// 받은 Map타입을 Model 클래스로 Converting

class User {
  // null값이 가능 << 변수뒤에 ?붙여줌
  int? id;
  String? username;
  String? password;
  String? email;

  User({this.id, this.username, this.password, this.email});

  // fromJson << Map을 DartObject로 변환하는 메서드
  // 원래는 fromMap이란 이름이 더 정확하지만 fromJson이름이 컨벤션
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    password = json["password"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "email": email
    };
  }
}
