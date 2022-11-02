import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:timetable/general/theme/app_colors.dart';

part 'custom_typography.tailor.dart';

@tailor
class _$CustomTypography {
  static List<TextStyle> headline = [
    TextStyle(
      fontSize: 32,
      height: 36 / 32,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    )
  ];
  static List<TextStyle> title = [
    TextStyle(
      fontSize: 24,
      height: 28 / 24,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    )
  ];
  static List<TextStyle> textFieldLabel = [
    TextStyle(
      fontSize: 24,
      height: 28 / 24,
      fontWeight: FontWeight.w400,
      color: AppColors.green,
    )
  ];
  static List<TextStyle> body1 = [
    TextStyle(
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    )
  ];
  static List<TextStyle> body2 = [
    TextStyle(
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    )
  ];
  static List<TextStyle> subtitle = [
    TextStyle(
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlue,
    )
  ];
}
