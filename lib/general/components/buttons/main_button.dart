import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.height = 64.0,
    this.borderRadius = 8.0,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final height;
  final borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.deepBlue,
        padding: EdgeInsets.zero,
        elevation: 0,
        foregroundColor: context.colors.lightBlue,
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: context.typography.title.copyWith(
            color: context.colors.white,
          ),
        ),
      ),
    );
  }
}
