import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_04/post_repository.dart';
import 'package:flutter_riverpod_04/session_provider.dart';

// 1. 창고 데이터 (model)
class PostModel {
  int id;
  int userId;
  String title;
  PostModel(this.id, this.userId, this.title);

  // 이름이 있는 생성자 문법
  PostModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        title = json["title"];
}

// 2. 창고 (view model), 비지니스 로직이 들어간다.
class PostViewModel extends StateNotifier<PostModel?> {
  // 생성자를 통해 상태를 부모에게 전달한다.
  Ref ref;
  PostViewModel(super.state, this.ref);

  // 상태 초기화 << 필수적으로 있어야함
  void init() async {
    // 통신 코드
    PostModel postModel = await PostRepository().fetchPost(40);
    state = postModel;
  }

  void change() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    if (sessionUser.isLogin) {
      PostModel postModel = await PostRepository().fetchPost(50);

      // 바뀐 값을 받아서 state에 넘겨야 상태가 변화된 것
      state = postModel;
    }
  }

  //.. 그외  필요한 메서드 작성하면 됨
}

// 3. 창고 관리자 (provider)
// autoDispose << 화면에서 벗어나면 메모리에서 View데이터를 자동으로 삭제해줌
final postProvider =
    StateNotifierProvider.autoDispose<PostViewModel, PostModel?>((ref) {
  return PostViewModel(null, ref)..init();
});
