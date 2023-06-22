// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'custom_typography.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class CustomTypography extends ThemeExtension<CustomTypography> {
  const CustomTypography({
    required this.headline,
    required this.title,
    required this.textFieldLabel,
    required this.body1,
    required this.body2,
    required this.subtitle,
  });

  final TextStyle headline;
  final TextStyle title;
  final TextStyle textFieldLabel;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle subtitle;

  static final CustomTypography light = CustomTypography(
    headline: _$CustomTypography.headline[0],
    title: _$CustomTypography.title[0],
    textFieldLabel: _$CustomTypography.textFieldLabel[0],
    body1: _$CustomTypography.body1[0],
    body2: _$CustomTypography.body2[0],
    subtitle: _$CustomTypography.subtitle[0],
  );

  static final CustomTypography dark = CustomTypography(
    headline: _$CustomTypography.headline[1],
    title: _$CustomTypography.title[1],
    textFieldLabel: _$CustomTypography.textFieldLabel[1],
    body1: _$CustomTypography.body1[1],
    body2: _$CustomTypography.body2[1],
    subtitle: _$CustomTypography.subtitle[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  CustomTypography copyWith({
    TextStyle? headline,
    TextStyle? title,
    TextStyle? textFieldLabel,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? subtitle,
  }) {
    return CustomTypography(
      headline: headline ?? this.headline,
      title: title ?? this.title,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  @override
  CustomTypography lerp(ThemeExtension<CustomTypography>? other, double t) {
    if (other is! CustomTypography) return this;
    return CustomTypography(
      headline: TextStyle.lerp(headline, other.headline, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      textFieldLabel: TextStyle.lerp(textFieldLabel, other.textFieldLabel, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTypography &&
            const DeepCollectionEquality().equals(headline, other.headline) &&
            const DeepCollectionEquality().equals(title, other.title) &&
            const DeepCollectionEquality()
                .equals(textFieldLabel, other.textFieldLabel) &&
            const DeepCollectionEquality().equals(body1, other.body1) &&
            const DeepCollectionEquality().equals(body2, other.body2) &&
            const DeepCollectionEquality().equals(subtitle, other.subtitle));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(headline),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(textFieldLabel),
        const DeepCollectionEquality().hash(body1),
        const DeepCollectionEquality().hash(body2),
        const DeepCollectionEquality().hash(subtitle));
  }
}

extension CustomTypographyBuildContextProps on BuildContext {
  CustomTypography get _customTypography =>
      Theme.of(this).extension<CustomTypography>()!;
  TextStyle get headline => _customTypography.headline;
  TextStyle get title => _customTypography.title;
  TextStyle get textFieldLabel => _customTypography.textFieldLabel;
  TextStyle get body1 => _customTypography.body1;
  TextStyle get body2 => _customTypography.body2;
  TextStyle get subtitle => _customTypography.subtitle;
}
