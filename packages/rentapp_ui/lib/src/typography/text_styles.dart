import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

/// App Text Style Definitions
/// Source: https://m3.material.io/styles/typography/type-scale-tokens
abstract class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    fontFamily: FontFamily.josefinSans,
    fontWeight: AppFontWeight.regular,
    letterSpacing: -1.5,
  );

  /// Headline large Text Style
  static TextStyle get headlineLarge {
    return _baseTextStyle.copyWith(
      fontSize: 32,
      fontWeight: AppFontWeight.bold,
      color: Palette.black,
    );
  }

  /// Headline medium	Text Style
  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: AppFontWeight.bold,
      color: Palette.dark,
    );
  }

  /// Headline small Text Style
  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: AppFontWeight.bold,
      color: Palette.white,
    );
  }

  /// Title large Text Style
  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: AppFontWeight.bold,
      color: Palette.green,
    );
  }

  /// Title small	Text Style
  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: AppFontWeight.regular,
      color: Palette.grayLight,
    );
  }

  /// Label large	 Style
  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: AppFontWeight.regular,
      color: Palette.dark,
    );
  }

  /// Label medium Style
  static TextStyle get labelMedium {
    return _baseTextStyle.copyWith(
      fontSize: 13,
      fontWeight: AppFontWeight.bold,
      letterSpacing: -1,
      color: Palette.dark,
    );
  }

  /// Body large Text Style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: AppFontWeight.regular,
      color: Palette.grayExtraDark,
    );
  }

  /// Body medium Text Style (the default)
  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: AppFontWeight.regular,
      color: Palette.grayExtraDark,
    );
  }
}
