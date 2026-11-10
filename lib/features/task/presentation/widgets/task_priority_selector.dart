import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

/// Pemilih tingkat prioritas tugas (Low, Medium, High)
class TaskPrioritySelector extends StatelessWidget {
  final TaskPriority selectedPriority;
  final ValueChanged<TaskPriority> onPriorityChanged;

  const TaskPrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onPriorityChanged,
  });

  Color _getColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return AppColors.priorityLow;
      case TaskPriority.medium:
        return AppColors.priorityMedium;
      case TaskPriority.high:
        return AppColors.priorityHigh;
    }
  }

  Color _getBgColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return AppColors.priorityLowBg;
      case TaskPriority.medium:
        return AppColors.priorityMediumBg;
      case TaskPriority.high:
        return AppColors.priorityHighBg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Priority',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Space.h(8),
        Row(
          children: TaskPriority.values.map((priority) {
            final isSelected = priority == selectedPriority;
            final color = _getColor(priority);
            final bgColor = _getBgColor(priority);

            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: InkWell(
                  onTap: () => onPriorityChanged(priority),
                  borderRadius: BorderRadius.circular(10.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: isSelected ? bgColor : AppColors.surfaceCard,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isSelected ? color : AppColors.borderInput,
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Space.w(6),
                        Text(
                          priority.label,
                          style: AppTypography.titleSmall.copyWith(
                            color: isSelected ? color : AppColors.textSecondary,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

