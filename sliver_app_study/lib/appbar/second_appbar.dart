import 'package:flutter/material.dart';

class SecondAppbar extends StatelessWidget {
  const SecondAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView << 좌우로 슬라이드해서 넘길수있는 위젯
      // builder << item갯수만큼 어떤 처리를 해주는 메서드
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            leading: Icon(Icons.menu),
            title: Text("Around"),
            flexibleSpace: PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.network(
                  "https://picsum.photos/id/${index + 50}/200/300",
                  // BoxFit << Signature매개변수가 있으면 두번째로 밀려난다.
                  fit: BoxFit.cover,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
