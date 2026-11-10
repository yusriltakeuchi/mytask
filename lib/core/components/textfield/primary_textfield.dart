import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Field input teks terstandarisasi dengan label, validasi, dan penyesuaian multi-line
class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadOnly;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool isRequired;
  final AutovalidateMode autovalidateMode;

  const PrimaryTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.onTap,
    this.focusNode,
    this.textInputAction,
    this.isRequired = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Text(
                label!,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              if (isRequired) ...[
                Space.w(4),
                Text(
                  '*',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.danger,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          Space.h(8),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          readOnly: isReadOnly,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            helperText: helperText,
            helperStyle: AppTypography.bodySmall,
            errorText: errorText,
            errorStyle: AppTypography.bodySmall.copyWith(
              color: AppColors.danger,
            ),
            filled: true,
            fillColor: AppColors.surfaceInput,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: maxLines > 1 ? 14.h : 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.borderInput),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.borderInput),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.borderFocus, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.danger),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

