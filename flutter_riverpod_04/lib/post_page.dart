import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_04/post_view_model.dart';
import 'package:flutter_riverpod_04/session_provider.dart';

// 버튼 누를때 마다 사진이 변경
class PostPage extends ConsumerWidget {
  PostPage();

  // WidgetRef << Provider의 상태를 가져오는 매개변수
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("나 빌드됨");

    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network("https://picsum.photos/id/50/200/200",
                fit: BoxFit.cover),
          ),
          NewWidget(),
          ElevatedButton(
              onPressed: () {
                // ref.read << 창고에 접근가능, 값을 바꿀수 있게 해준다.
                ref.read(postProvider.notifier).change();
              },
              child: Text("값 변경")),
          ElevatedButton(
              onPressed: () {
                SessionUser sessionUser = ref.read(sessionProvider);
                sessionUser.isLogin = true;
              },
              child: Text("로그인")),
        ],
      ),
    );
  }
}

class NewWidget extends ConsumerWidget {
  const NewWidget({
    super.key,
  });

  // watch << 변화를 감지해서 ReBuild하는 리스너 역할
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostModel? model = ref.watch(postProvider);
    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Text(
          "id : ${model.id}, userId : ${model.userId}, title : ${model.title}",
          style: TextStyle(fontSize: 30));
    }
  }
}
