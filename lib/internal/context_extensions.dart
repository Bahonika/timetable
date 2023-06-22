import 'package:flutter/material.dart';
import 'package:timetable/general/theme/custom_colors.dart';
import 'package:timetable/general/theme/custom_typography.dart';

extension ColorsExtension on BuildContext {
  CustomColors get colors => Theme.of(this).extension<CustomColors>()!;
}

extension TypographyExtension on BuildContext {
  CustomTypography get typography => Theme.of(this).extension<CustomTypography>()!;
}
