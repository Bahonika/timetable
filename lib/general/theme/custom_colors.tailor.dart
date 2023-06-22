// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'custom_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.deepBlue,
    required this.red,
    required this.white,
    required this.black,
    required this.lightBlue,
    required this.orange,
    required this.green,
  });

  final Color deepBlue;
  final Color red;
  final Color white;
  final Color black;
  final Color lightBlue;
  final Color orange;
  final Color green;

  static final CustomColors light = CustomColors(
    deepBlue: _$CustomColors.deepBlue[0],
    red: _$CustomColors.red[0],
    white: _$CustomColors.white[0],
    black: _$CustomColors.black[0],
    lightBlue: _$CustomColors.lightBlue[0],
    orange: _$CustomColors.orange[0],
    green: _$CustomColors.green[0],
  );

  static final CustomColors dark = CustomColors(
    deepBlue: _$CustomColors.deepBlue[1],
    red: _$CustomColors.red[1],
    white: _$CustomColors.white[1],
    black: _$CustomColors.black[1],
    lightBlue: _$CustomColors.lightBlue[1],
    orange: _$CustomColors.orange[1],
    green: _$CustomColors.green[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  CustomColors copyWith({
    Color? deepBlue,
    Color? red,
    Color? white,
    Color? black,
    Color? lightBlue,
    Color? orange,
    Color? green,
  }) {
    return CustomColors(
      deepBlue: deepBlue ?? this.deepBlue,
      red: red ?? this.red,
      white: white ?? this.white,
      black: black ?? this.black,
      lightBlue: lightBlue ?? this.lightBlue,
      orange: orange ?? this.orange,
      green: green ?? this.green,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      deepBlue: Color.lerp(deepBlue, other.deepBlue, t)!,
      red: Color.lerp(red, other.red, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      green: Color.lerp(green, other.green, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomColors &&
            const DeepCollectionEquality().equals(deepBlue, other.deepBlue) &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(white, other.white) &&
            const DeepCollectionEquality().equals(black, other.black) &&
            const DeepCollectionEquality().equals(lightBlue, other.lightBlue) &&
            const DeepCollectionEquality().equals(orange, other.orange) &&
            const DeepCollectionEquality().equals(green, other.green));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(deepBlue),
        const DeepCollectionEquality().hash(red),
        const DeepCollectionEquality().hash(white),
        const DeepCollectionEquality().hash(black),
        const DeepCollectionEquality().hash(lightBlue),
        const DeepCollectionEquality().hash(orange),
        const DeepCollectionEquality().hash(green));
  }
}

extension CustomColorsBuildContextProps on BuildContext {
  CustomColors get _customColors => Theme.of(this).extension<CustomColors>()!;
  Color get deepBlue => _customColors.deepBlue;
  Color get red => _customColors.red;
  Color get white => _customColors.white;
  Color get black => _customColors.black;
  Color get lightBlue => _customColors.lightBlue;
  Color get orange => _customColors.orange;
  Color get green => _customColors.green;
}
