import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

/// Tab filter status tugas (All, Pending, Completed) berbentuk pill
class TaskFilterTabs extends StatelessWidget {
  final TaskFilter selectedFilter;
  final ValueChanged<TaskFilter> onFilterChanged;

  const TaskFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: TaskFilter.values.map((filter) {
          final isSelected = filter == selectedFilter;

          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: InkWell(
              onTap: () => onFilterChanged(filter),
              borderRadius: BorderRadius.circular(20.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.surfaceCard,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.borderSubtle,
                  ),
                ),
                child: Text(
                  filter.label,
                  style: AppTypography.titleSmall.copyWith(
                    color: isSelected ? AppColors.textInverse : AppColors.textSecondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

