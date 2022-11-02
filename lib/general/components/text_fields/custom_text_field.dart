import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final borderWidth = 3.0;
  final maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.typography.title,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: context.typography.textFieldLabel,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: context.colors.deepBlue,
            width: borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: context.colors.lightBlue,
            width: borderWidth,
          ),
        ),
      ),
      maxLines: maxLines,
      controller: controller,
    );
  }
}
