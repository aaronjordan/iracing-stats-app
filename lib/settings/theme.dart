import 'package:flutter/material.dart';

abstract class AppStyles {
  // fonts
  static const primaryFont = "Inter";
  static const titleFontSize = 32.0;
  static const titleFontWeight = FontWeight.w700;
  static const subtitleFontSize = 24.0;
  static const subtitleFontWeight = FontWeight.w300;

  // colors
  static const primarySwatch = Colors.indigo;
  static const secondarySwatch = Colors.cyan;
  static final primaryTextColor = Colors.grey[900];
  static final secondaryTextColor = Colors.grey[700];

  // layouts
  static const appInsetMargin = 64.0;
  static const defaultGapSize = 24.0;
  static const defaultInsetSize = 12.0;
}

class StandardSpacer extends StatelessWidget {
  final double multiplier;
  const StandardSpacer({Key? key, this.multiplier = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: AppStyles.defaultGapSize * multiplier);
  }
}

final appTheme = ThemeData(
  fontFamily: AppStyles.primaryFont,
  primarySwatch: AppStyles.primarySwatch,
);
