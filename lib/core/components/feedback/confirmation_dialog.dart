import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/button/primary_button.dart';
import 'package:mytask/core/components/button/secondary_button.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Dialog konfirmasi tindakan destruktif (seperti menghapus tugas)
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final Color? confirmColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Hapus',
    this.cancelText = 'Batal',
    this.confirmColor,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Hapus',
    String cancelText = 'Batal',
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmColor: confirmColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: AppColors.surfaceElevated,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.dangerLight,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete_rounded,
                    color: AppColors.danger,
                    size: 24.w,
                  ),
                ),
                Space.w(12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTypography.titleLarge,
                  ),
                ),
              ],
            ),
            Space.h(12),
            Text(
              message,
              style: AppTypography.bodyMedium,
            ),
            Space.h(24),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: cancelText,
                    height: 44.h,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ),
                Space.w(12),
                Expanded(
                  child: PrimaryButton(
                    text: confirmText,
                    height: 44.h,
                    backgroundColor: confirmColor ?? AppColors.danger,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

