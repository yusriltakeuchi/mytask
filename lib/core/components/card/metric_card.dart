import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_shadows.dart';
import 'package:mytask/core/design_system/app_typography.dart';

/// Kartu statistik ringkasan di dashboard (Total, Completed, Pending)
class MetricCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback? onTap;

  const MetricCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.borderSubtle),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(icon, color: iconColor, size: 20.w),
                ),
              ),
              Space.h(10),
              Text(
                '$count',
                style: AppTypography.heading2.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              Space.h(4),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

