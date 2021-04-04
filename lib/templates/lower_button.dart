import 'package:flutter/material.dart';

import '../main.dart';

class LowerButton extends StatelessWidget {
  Widget widget;
  String text;

  LowerButton(this.widget, this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * 0.47,
      height: MediaQuery.of(context).size.height * 0.14,
      child: RaisedButton(
        splashColor: lightBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        color: deepBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.04),
          ),
        ),
      ),
    );
  }
}
