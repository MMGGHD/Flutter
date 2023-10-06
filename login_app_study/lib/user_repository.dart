// 자바에서는 Repository로 DB에 연결한다.
// Flutter에서는 Repository로 스프링 컨트롤러에 연결한다.
class UserRepository {
  void login(String email, String password) {
    print("email : $email");
    print("password : $password");
    // 통신 코드, 데이터 보내기
    // 정상 or 비정상 응답 받기
  }

  void join(String email, String password, String username) {
    print("email : $email");
    print("password : $password");
    print("username : $username");
    // 통신 코드, 데이터 보내기
    // 정상 or 비정상 응답 받기
  }
}
