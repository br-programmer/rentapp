import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

abstract class RentAppTheme {
  static const FlexSchemeData _ogFlexScheme = FlexSchemeData(
    name: 'RentApp theme',
    description: 'RentApp theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Palette.green,
      primaryContainer: Palette.green,
      secondary: Palette.green,
      secondaryContainer: Palette.green,
      tertiary: Palette.green,
      tertiaryContainer: Palette.green,
    ),
    dark: FlexSchemeColor(
      primary: Palette.green,
      primaryContainer: Palette.green,
      secondary: Palette.green,
      secondaryContainer: Palette.green,
      tertiary: Palette.green,
      tertiaryContainer: Palette.green,
    ),
  );

  static final light = FlexThemeData.light(
    colors: _ogFlexScheme.light,
    scaffoldBackground: Palette.white,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      foregroundColor: Palette.transparent,
      backgroundColor: Palette.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: _textThemeLight,
  );

  static final dark = FlexThemeData.dark(
    colors: _ogFlexScheme.dark,
    scaffoldBackground: Palette.dark,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.transparent,
      foregroundColor: Palette.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: _textThemeDark,
  );

  static TextTheme get _textThemeLight => TextTheme(
        headlineLarge: AppTextStyle.headlineLarge,
        headlineMedium: AppTextStyle.headlineMedium,
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        labelLarge: AppTextStyle.labelLarge,
        labelMedium: AppTextStyle.labelMedium,
      );

  static TextTheme get _textThemeDark => TextTheme(
        headlineLarge: AppTextStyle.headlineLarge.copyWith(
          color: Palette.white,
        ),
        headlineMedium: AppTextStyle.headlineMedium.copyWith(
          color: Palette.white,
        ),
        headlineSmall: AppTextStyle.headlineSmall,
        titleLarge: AppTextStyle.titleLarge,
        titleSmall: AppTextStyle.titleSmall.copyWith(
          color: Palette.grayDark,
        ),
        bodyLarge: AppTextStyle.bodyLarge.copyWith(
          color: Palette.gray,
        ),
        bodyMedium: AppTextStyle.bodyMedium.copyWith(
          color: Palette.gray,
        ),
        labelLarge: AppTextStyle.labelLarge.copyWith(
          color: Palette.white,
        ),
        labelMedium: AppTextStyle.labelMedium.copyWith(
          color: Palette.white,
        ),
      );
}
