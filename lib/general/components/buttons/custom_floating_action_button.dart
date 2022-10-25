import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.colors.lightBlue,
      splashColor: context.colors.deepBlue,
      foregroundColor: context.colors.white,
      child: Icon(icon),
    );
  }
}
