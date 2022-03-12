import 'package:flutter/material.dart';

import '../main.dart';

class LowerButton extends StatelessWidget {
  Widget widget;
  String text;

  LowerButton(this.widget, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      height: MediaQuery.of(context).size.height * 0.14,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: deepBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),

        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.035 > 40
                  ? 40
                  : MediaQuery.of(context).size.shortestSide * 0.035 < 15
                      ? 15
                      : MediaQuery.of(context).size.shortestSide * 0.035),
        ),
      ),
    );
  }
}
