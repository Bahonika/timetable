import 'package:flutter/material.dart';
import 'package:timetable/general/components/buttons/arrow_back_button.dart';
import 'package:timetable/internal/context_extensions.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.actions,
  }) : super(key: key);

  final String title;
  final VoidCallback? onBack;
  final double? toolbarHeight = 72;
  final List<Widget>? actions;

  bool get canPop => onBack != null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.white,
      elevation: 0,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: canPop,
        child: ArrowBackButton(
          onPressed: onBack,
        ),
      ),
      title: Text(
        title,
        style: context.typography.headline,
      ),
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        toolbarHeight!,
      );
}
