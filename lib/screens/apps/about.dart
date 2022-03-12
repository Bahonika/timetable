import 'package:flutter/material.dart';

import '../../main.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.shortestSide * 0.11 < 55
            ? 55
            : MediaQuery.of(context).size.shortestSide * 0.11 > 85
                ? 85
                : MediaQuery.of(context).size.shortestSide * 0.11,
        title: Text(
          "Об авторе",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: deepBlue,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: RichText(
          text: TextSpan(
              text:
                  "Приложение было разработано по собственной инициативе студентами ",
              style: TextStyle(color: Colors.black, fontSize: 23),
              children: [
                TextSpan(
                  text: "Лаборатории вычислительных систем и сетей МАГУ \n",
                  style: TextStyle(color: deepBlue, fontSize: 23),
                ),
                TextSpan(
                  text:
                      "Багинским Денисом и Колоколовым Всеволодом.\n\nПо поводу любых жалоб/предложений/благодарностей обращаться на электронную почту ",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                TextSpan(
                  text: "bahonika1@mail.ru",
                  style: TextStyle(color: deepBlue, fontSize: 23),
                )
              ]),
        ),
      ),
    );
  }
}
