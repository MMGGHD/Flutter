import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_app_study/size.dart';

import '../components/custom_text_form_field.dart';
import '../components/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // LoginPage 클래스가 열리면 build메서드가 자동으로 실행된다.
  // 이때 트리구조를 이해하는것이 중요하다.
  // context는 현재 트리에서 어느 위치에 있는가에 대한 정보이다.
  // ex) LoginPage 안쪽안쪽에 있는 logo의 context는 타고 들어간 부모위젯들의 정보를 알고있다.
  // 타고 들어갈때 context를 가지고 가기 때문
  // context를 통해 변수를 들고가거나 정보를 가져올수 있다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // inset 영역때문에 Column안쓰고 ListView씀
      body: Padding(
        // 보통 App의 Padding은 16Point를 기본으로 사용한다.
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap),
            Logo("login"),
            // Form << Html의 Form태그와 같다. (데이터 전송 가능)
            Form(
                child: Column(
              children: [
                CustomTextFormField(text: "Email"),
                CustomTextFormField(text: "Password", isPassword: true),
                SizedBox(height: large_gap),
                // onPressed() << TextButton을 클릭하면 지정된 이벤트가 실행됨
                TextButton(
                    onPressed: () {
                      // Navigator.pushNamed() << 지정한 곳으로 이동
                      // home으로 이동할때 context를 들고간다.
                      // context에 스택 구조로 정보가 쌓인다.
                      // pushNamed로 context에는 login위에 homePage 정보가 있다.
                      Navigator.pushNamed(context, "/home");
                      // Navigator.pop(context);
                    },
                    child: Text("login")),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
