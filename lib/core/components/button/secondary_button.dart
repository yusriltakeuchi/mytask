import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Tombol sekunder / bordered
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.leadingIcon,
    this.height,
    this.width,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          side: BorderSide(
            color: borderColor ?? AppColors.borderInput,
            width: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: 20.w,
                color: textColor ?? AppColors.textPrimary,
              ),
              Space.w(8),
            ],
            Text(
              text,
              style: AppTypography.button.copyWith(
                color: textColor ?? AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

