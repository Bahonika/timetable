import 'package:flutter/material.dart';

class DecoratedText extends Text {
  DecoratedText(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
    );
  }
}
