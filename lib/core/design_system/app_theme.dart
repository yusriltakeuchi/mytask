import 'package:flutter/material.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Tema global aplikasi MyTask
class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.textInverse,
        surface: AppColors.surfaceCard,
        onSurface: AppColors.textPrimary,
        error: AppColors.danger,
        onError: AppColors.textInverse,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.heading3,
        iconTheme: const IconThemeData(color: AppColors.iconPrimary),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bgSecondary,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

