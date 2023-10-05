import 'package:flutter/material.dart';

import '../size.dart';

class CustomTextFormField extends StatelessWidget {
  // text는 required, isPassword는 기본값 false
  String text;
  bool isPassword;
  CustomTextFormField({required this.text, this.isPassword = false});

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
