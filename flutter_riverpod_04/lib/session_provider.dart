// 1. 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionUser {
  String? jwt;
  bool isLogin;

  SessionUser({this.isLogin = false});
}

// 2. 창고 << Provider일때는 만들지 않는다. (화면 변경이 없기 때문)

// 3. 창고 관리자
final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});
