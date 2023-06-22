import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_back_sharp,
        color: context.colors.black,
        size: 24,
      ),
    );
  }
}
