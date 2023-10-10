import 'package:flutter/material.dart';

class ThirdAppbar extends StatelessWidget {
  const ThirdAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          // Container에 background 이미지 넣을때는 decoration
          // Container background를 미리 잡아놓고 그 위에 Scaffold를 얹는 방식
          // background에는 Body가 없으므로 글자를 넣을수 없는 단점이있다.
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://picsum.photos/id/${index + 50}/200/300"),
                fit: BoxFit.cover),
          ),
          // 여기(Scaffold)부터 App이라고 생각하고 코드를 작성하면 된다.
          child: Scaffold(
            // Colors.transparent << 투명색으로 바꾸는 매개변수
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Around"),
              leading: Icon(Icons.menu),
            ),
            body: Center(
              child: Text("page${index}"),
            ),
          ),
        );
      },
    );
  }
}
