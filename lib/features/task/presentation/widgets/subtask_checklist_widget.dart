import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';

/// Widget daftar subtugas (checklist) dengan persentase penyelesaian
class SubtaskChecklistWidget extends StatelessWidget {
  final List<SubTaskEntity> subtasks;
  final ValueChanged<String>? onToggleSubtask;

  const SubtaskChecklistWidget({
    super.key,
    required this.subtasks,
    this.onToggleSubtask,
  });

  @override
  Widget build(BuildContext context) {
    if (subtasks.isEmpty) {
      return const SizedBox.shrink();
    }

    final completedCount = subtasks.where((s) => s.isDone).length;
    final totalCount = subtasks.length;
    final progress = totalCount > 0 ? (completedCount / totalCount) : 0.0;
    final percentage = (progress * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtasks',
              style: AppTypography.titleLarge,
            ),
            Text(
              '$completedCount of $totalCount completed',
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Space.h(12),

        // Progress Overview & Circle Chart
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress Overview',
                      style: AppTypography.titleSmall,
                    ),
                    Space.h(8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8.h,
                        backgroundColor: AppColors.bgPrimary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          percentage == 100 ? AppColors.success : AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Space.w(16),
              // Circular progress badge
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 52.w,
                    height: 52.w,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 4.5.w,
                      backgroundColor: AppColors.bgPrimary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        percentage == 100 ? AppColors.success : AppColors.primary,
                      ),
                    ),
                  ),
                  Text(
                    '$percentage%',
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Space.h(14),

        // Checklist Items
        ...subtasks.map((subtask) {
          return InkWell(
            onTap: onToggleSubtask != null ? () => onToggleSubtask!(subtask.id) : null,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
              child: Row(
                children: [
                  Icon(
                    subtask.isDone ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                    color: subtask.isDone ? AppColors.success : AppColors.textTertiary,
                    size: 22.w,
                  ),
                  Space.w(10),
                  Expanded(
                    child: Text(
                      subtask.title,
                      style: AppTypography.bodyMedium.copyWith(
                        decoration: subtask.isDone ? TextDecoration.lineThrough : null,
                        color: subtask.isDone ? AppColors.textTertiary : AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

