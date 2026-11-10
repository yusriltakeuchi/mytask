import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytask/core/design_system/app_colors.dart';

/// Indikator memuat data serbaguna
class AppLoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;

  const AppLoadingIndicator({
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 28.w,
        height: size ?? 28.w,
        child: CircularProgressIndicator(
          strokeWidth: 2.5.w,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
        ),
      ),
    );
  }
}

