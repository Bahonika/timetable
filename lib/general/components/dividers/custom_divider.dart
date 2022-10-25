import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: context.colors.green,
    );
  }
}
