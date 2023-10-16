import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// 창고 class(=ViewModel) 만들기
// 1. Provider << 상태(변수)만 가지고 있어도 됨.(메서드는 필요없다)
// 타입이 한개일 경우 클래스로도 안 만들어도됨 (하지만 거의 쓰지않는 방식)
int num = 1;

// 창고 Data(=Model)
class Model {
  int num;
  Model(this.num);
}

// 2. StateNotifierProvider << 상태 + 변화시킬수 있는 메서드를 가지고있어야함
// StateNotifier<>를 상속하고, 제네릭은 보유한 창고 데이터 객체타입
class ViewModel extends StateNotifier<Model?> {
  // 창고 데이터는 상태값이 아니다.
  // 이걸 부모 state변수에 super로 전달해야 상태값이 된다.
  Model? model;

  // 창고를 만들면서 창고 데이터를 StateNotifier에 전달.
  // super(*)안에 전달한 데이터는 T 타입의 _state(상태 데이터)안에 담긴다.
  // StateNotifier는 전달받은 데이터를 가지고 rebuild
  // 상태를 변경할때는 state(상태)값을 받아와서 상태를 변경시켜야함
  ViewModel({this.model}) : super(model);

  // model데이터 초기값을 설정하는 메서드
  void init() {
    // 통신코드가 들어갈 자리

    // 부모의 state(model)값을 변경
    state = Model(1);
  }

  void add() {
    // state(상태)값을 받아와서 상태를 변경시켜야함
    Model? model = state;
    model?.num++;
    state = model;
  }
}

// 창고 관리자 생성하기 Provider << read만 가능
// Provider<int> << int를 관리하는 Provider라는뜻
// 통신할때는 원래 FutureProvider를 사용해야함
final numProvider = Provider<int>((ref) {
  return num;
});

// StateNotifierProvider<창고이름, 창고가 관리하는 데이터 타입>
final myNumProvider = StateNotifierProvider<ViewModel, Model?>((ref) {
  // 최초로 StateNotifierProvider를 설정할때 null값을 넣는다.
  // 원래는 통신으로 받아온 데이터를 넣는다.
  // 화면이 그려지는 속도가 데이터를 받는것보다 더 빠르기 때문에 기다리는 키워드 써야함
  // StateNotifierProvider에는 async 못쓰기 때문에 FutureProvider를 사용
  // 복잡해짐 + 데이터 받아지기 전까지 그림이 그려지지 않음
  // 그래서 아래 방식을 사용
  // 통신 코드를 넣어놓고 창고값에는 null을 넣어놓는다. (null로 처음 그림이 그려짐)
  // 데이터가 받아지면 watch방식이기 때문에 한번더 그려진다. (그림이 2번 그려지는 방식)
  return ViewModel();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [MyText1(), MyText2(), MyText3(), MyButton()],
          ),
        ),
      ),
    );
  }
}

class MyButton extends ConsumerWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(onPressed: () {}, child: Text("상태변경"));
  }
}

class MyText3 extends StatelessWidget {
  const MyText3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("수신 안함", style: TextStyle(fontSize: 30));
  }
}

class MyText2 extends ConsumerWidget {
  const MyText2({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int num = ref.read(numProvider);
    return Text("${num}", style: TextStyle(fontSize: 30));
  }
}

// ConsumerWidget를 상속 << WidgetRef에 접근이 가능
class MyText1 extends ConsumerWidget {
  const MyText1({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 창고 관리자에게 read 요청
    int num = ref.read(numProvider);
    return Text("${num}", style: TextStyle(fontSize: 30));
  }
}
