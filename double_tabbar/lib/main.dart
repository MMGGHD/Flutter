import 'package:flutter/material.dart';

import 'double_tapbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("앱바"),
        leading: Icon(Icons.contact_support_sharp),
      ),
      body: DoubleTabbar(),
    );
  }
}

class DoubleTabbar2 extends StatefulWidget {
  const DoubleTabbar2({super.key});

  @override
  State<DoubleTabbar2> createState() => _DoubleTabbar2State();
}

class _DoubleTabbar2State extends State<DoubleTabbar2>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home, color: Colors.black)),
            Tab(icon: Icon(Icons.access_alarm, color: Colors.black)),
            Tab(icon: Icon(Icons.account_circle, color: Colors.black)),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            // SizedBox(height: 15, child: Text("탭바뷰1")),
            // SizedBox(height: 15, child: Text("탭바뷰2")),
            // SizedBox(height: 15, child: Text("탭바뷰3")),
            InnerTabbar(),
            InnerTabbar(),
            // InnerTabbar(),
            Column(
              children: [InnerTabbar(), Text("메인탭바")],
            ),
          ],
        )),
      ],
    );
  }
}

class InnerTabbar extends StatefulWidget {
  const InnerTabbar({super.key});

  @override
  State<InnerTabbar> createState() => _InnerTabbarState();
}

class _InnerTabbarState extends State<InnerTabbar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home, color: Colors.black)),
            Tab(icon: Icon(Icons.access_alarm, color: Colors.black)),
            Tab(icon: Icon(Icons.account_circle, color: Colors.black)),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            SizedBox(
                height: 15,
                child: Text("탭바뷰1", style: TextStyle(fontSize: 30))),
            SizedBox(
                height: 15,
                child: Text("탭바뷰2", style: TextStyle(fontSize: 30))),
            SizedBox(
                height: 15,
                child: Text("탭바뷰3", style: TextStyle(fontSize: 30))),
          ],
        )),
      ],
    );
  }
}
