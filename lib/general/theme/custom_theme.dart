import 'package:flutter/material.dart';
import 'package:timetable/general/theme/custom_colors.dart';
import 'package:timetable/general/theme/custom_typography.dart';

class CustomTheme {
  static ThemeData get light {
    return ThemeData.light().copyWith(
      extensions: [
        CustomColors.light,
        CustomTypography.light,
        // CustomComponentsParts.standard,
      ],
      scaffoldBackgroundColor: CustomColors.light.white,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: CustomColors.light.black,
      ),
    );
  }
}
