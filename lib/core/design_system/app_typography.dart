import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytask/core/design_system/app_colors.dart';

/// Skala tipografi terstandarisasi berbasis Plus Jakarta Sans.
class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'PlusJakartaSans';

  // Headlines & Display
  static TextStyle get heading1 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle get heading2 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
      );

  static TextStyle get heading3 => TextStyle(
        fontFamily: fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Subtitles & Titles
  static TextStyle get titleLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Body Texts
  static TextStyle get bodyLarge => TextStyle(
        fontFamily: fontFamily,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: fontFamily,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  // Labels & Captions
  static TextStyle get label => TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      );

  static TextStyle get caption => TextStyle(
        fontFamily: fontFamily,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textTertiary,
      );

  static TextStyle get button => TextStyle(
        fontFamily: fontFamily,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textInverse,
      );
}

