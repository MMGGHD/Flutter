import 'package:flutter/material.dart';

import '../size.dart';

class CustomTextFormField extends StatelessWidget {
  // text와 validate함수는 required, isPassword는 기본값 false
  String text;
  bool isPassword;
  final validate;

  // 입력값을 받아주는 컨트롤러
  final textController;

  CustomTextFormField({
    required this.text,
    this.isPassword = false,
    required this.validate,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${text}"),
        // small_gap << Size.dart에서 만들어둔 크기
        SizedBox(height: small_gap),
        // inset을 만들어주는 위젯
        // ListView가 부모로있으면 여러개가 있어도 화면을 가리지 않는다.
        // resizeToAvoidBottomInset으로 밀리지 않게 설정할수 있다.
        TextFormField(
          // 연결된 값을 받아주는 controller 연결
          controller: textController,
          // 값을 입력하고 Form버튼을 누르면 입력값이 value변수로 들어간다.
          // 1. value가 들어온다.
          // 2. value로 유효성검사 로직을 수행한다.
          // 3. 아무 문제 없으면 validator가 null을 return = 통과
          // 4. 문제가 있으면 어떤 메시지 return == 실패
          validator: validate,
          // obscureText << Html input태그의 PW처럼 보이게 하는 기능
          obscureText: isPassword,
          // style은 내부 텍스트를 꾸미는 메서드
          decoration: InputDecoration(
              // hintText << PlaceHolder와 같은 기능
              hintText: "Enter ${text}",
              // focusedBorder << inset을 클릭했을때 디자인
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // focusedErrorBorder << inset가 클릭되고 에러가 있을때 디자인
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // errorBorder << inset에 포커스가 없고 에러가 있을때 디자인
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // enabledBorder << inset에 포커스가 없을때 디자인
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
      ],
    );
  }
}
