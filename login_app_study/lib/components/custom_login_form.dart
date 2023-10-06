import 'package:flutter/material.dart';
import 'package:login_app_study/user_repository.dart';
import 'package:login_app_study/validator_util.dart';

import '../size.dart';
import 'custom_text_form_field.dart';

class CustomLoginForm extends StatelessWidget {
  // Vaildation하기위한 Key객체(전역 키 객체) 생성
  // final은 메모리에서 ReadOnly영역을 할당하는 선언이다.
  // Flutter에서 Final은 var를 내부적으로 포함하고 있다.
  // var는 변수타입을 알아서 찾아주는 선언.
  // final num = 10; 코드는 final var num = 10; 과 같다.
  final _formKey = GlobalKey<FormState>();
  // TextEditingController()로
  final _email = TextEditingController();
  final _password = TextEditingController();

  CustomLoginForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      // Form 위젯에 key를 분배하면 유효성 검사를 할수있다.
      // _formKey << Form의 모든 정보가 담겨있다.
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            text: "Email",
            validate: validateEmail(),
            // textController에 데이터 전달
            textController: _email,
          ),
          CustomTextFormField(
            text: "Password",
            isPassword: true,
            validate: validatePassword(),
            // textController에 데이터 전달
            textController: _password,
          ),
          SizedBox(height: large_gap),
          // onPressed() << TextButton을 클릭하면 지정된 이벤트가 실행됨
          // Form태그 안에 있으므로 summit button이 된다.
          TextButton(
              onPressed: () {
                // _formKey.currentState << '모든' 폼필드의 현재상태를 뽑아냄
                // _formKey가 연결이 안되면 currentState가 null이됨
                // validate() << 모든 응답이 null이면 true가 리턴
                // 메시지를 받으면 List를 만들어서 메시지를 저장해놓는다.
                if (_formKey.currentState!.validate()) {
                  UserRepository repo = UserRepository();
                  // 컨트롤러의 값을 대입 (trim은 앞뒤 공백을 없애주는 메서드)
                  repo.login(_email.text.trim(), _password.text.trim());
                  // Navigator.pushNamed() << 지정한 곳으로 이동
                  // home으로 이동할때 context를 들고간다.
                  // context에 스택 구조로 정보가 쌓인다.
                  // pushNamed로 context에는 login위에 homePage 정보가 있다.
                  Navigator.pushNamed(context, "/home");
                  // Navigator.pop(context);
                }
              },
              child: Text("login")),
        ],
      ),
    );
  }
}
