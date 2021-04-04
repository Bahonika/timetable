import 'package:flutter/material.dart';

import '../../main.dart';
import '../../templates/text_decoration.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DecoratedText("Об авторе"),
        backgroundColor: deepBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: RichText(
          text: TextSpan(
            text: "Приложение было разработано по собственной инициативе студентами ",
            style: TextStyle(color: Colors.black, fontSize: 23),
            children: [
              TextSpan(
                text: "Лаборатории вычислительных систем и сетей МАГУ \n",
                style: TextStyle(color: deepBlue, fontSize: 23),
              ),
              TextSpan(
                text: "Багинским Денисом и Колоколовым Всеволодом.\n\nПо поводу любых жалоб/предложений/благодарностей обращаться на электронную почту ",
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
              TextSpan(
                text: "bahonika1@mail.ru",
                style: TextStyle(color: deepBlue, fontSize: 23),

              )
            ]
          ),
        ),
      ),
    );
  }
}
