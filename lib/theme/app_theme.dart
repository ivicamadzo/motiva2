import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'motiva_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: MotivaTypography.fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: MotivaTypography.h2.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mediumBorder),
        elevation: 0,
        color: AppColors.surface,
      ),
      textTheme: TextTheme(
        headlineLarge: MotivaTypography.h1,
        headlineMedium: MotivaTypography.h2,
        headlineSmall: MotivaTypography.h3,
        bodyLarge: MotivaTypography.body,
        bodyMedium: MotivaTypography.bodySmall,
        labelLarge: MotivaTypography.button,
        bodySmall: MotivaTypography.caption,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.smallBorder),
        ),
      ),
    );
  }
}
