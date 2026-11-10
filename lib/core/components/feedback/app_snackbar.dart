import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Utilitas SnackBar modern untuk umpan balik pengguna
class AppSnackBar {
  const AppSnackBar._();

  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_rounded,
    );
  }

  static void showError(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.danger,
      icon: Icons.error_rounded,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning_rounded,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        elevation: 4,
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Row(
          children: [
            Icon(icon, color: AppColors.textInverse, size: 22.w),
            Space.w(12),
            Expanded(
              child: Text(
                message,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textInverse,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

