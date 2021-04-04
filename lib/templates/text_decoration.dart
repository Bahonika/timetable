import 'package:timetable/main.dart';
import 'package:flutter/material.dart';

class DecoratedText extends Text {
  DecoratedText(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: width/16.6,
      ),
    );
  }
}
