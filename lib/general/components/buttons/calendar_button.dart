import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.calendar_today_sharp,
        color: context.colors.black,
      ),
    );
  }
}
