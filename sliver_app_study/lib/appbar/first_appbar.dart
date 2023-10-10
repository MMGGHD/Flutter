import 'package:flutter/material.dart';

class FirstAppbar extends StatelessWidget {
  const FirstAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // appbar 대신 CustomScrollView()
      slivers: [
        SliverAppBar(
          // pinned: true << appbar가 고정됨
          pinned: false,
          // snap과 floating << 세트로 고정
          // snap은 튕기면서 appbar를 모두 띄움
          // floating은 appbar를 띄우는 역할
          // snap: true,
          floating: true,
          title: Text("appbar2", style: TextStyle(color: Colors.white)),
          expandedHeight: 250,
          flexibleSpace: Container(
            color: Colors.red,
            child: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          // pinned: true << appbar가 고정됨
          pinned: true,
          title: Text("appbar1", style: TextStyle(color: Colors.white)),
        ),
        // sliver 안에는 sliver 타입만 들어가야한다
        // ListView 대신 SliverList를 써야한다.
        SliverList(
          delegate:
              // ListTile() << List의 형태를 가지고있는 Tile
              SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) => ListTile(
              leading: Icon(Icons.person),
              title: Text("${index}"),
              trailing: Icon(Icons.account_balance),
            ),
          ),
        ),
      ],
    );
  }
}
