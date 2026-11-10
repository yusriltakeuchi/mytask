import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Tombol aksi utama (primary) dengan penskalaan ScreenUtil dan indikator loading
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    final Color effectiveFg = textColor ?? AppColors.textInverse;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          disabledBackgroundColor: AppColors.borderSubtle,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveFg),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingIcon != null) ...[
                    Icon(leadingIcon, size: 20.w, color: effectiveFg),
                    Space.w(8),
                  ],
                  Text(
                    text,
                    style: AppTypography.button.copyWith(
                      color: effectiveFg,
                      fontSize: fontSize ?? 15.sp,
                    ),
                  ),
                  if (trailingIcon != null) ...[
                    Space.w(8),
                    Icon(trailingIcon, size: 20.w, color: effectiveFg),
                  ],
                ],
              ),
      ),
    );
  }
}

