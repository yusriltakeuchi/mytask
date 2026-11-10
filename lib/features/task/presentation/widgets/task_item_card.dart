import 'package:flutter/material.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_shadows.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/core/utils/date_formatter.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

/// Kartu item tugas di daftar tugas (Home Screen) dengan solid icons
class TaskItemCard extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onTap;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;

  const TaskItemCard({
    super.key,
    required this.task,
    required this.onTap,
    required this.onToggleStatus,
    required this.onDelete,
  });

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return AppColors.priorityLow;
      case TaskPriority.medium:
        return AppColors.priorityMedium;
      case TaskPriority.high:
        return AppColors.priorityHigh;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOverdue = DateFormatter.isOverdue(task.deadline, isCompleted: task.isCompleted);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: task.isCompleted ? AppColors.success.withValues(alpha: 0.3) : AppColors.borderSubtle,
        ),
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Tombol Centang Cepat (Status Selesai - Solid Icon)
                GestureDetector(
                  onTap: onToggleStatus,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      color: task.isCompleted ? AppColors.success : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: task.isCompleted ? AppColors.success : AppColors.borderInput,
                        width: 2,
                      ),
                    ),
                    child: task.isCompleted
                        ? Icon(
                            Icons.check_rounded,
                            color: AppColors.textInverse,
                            size: 16.w,
                          )
                        : null,
                  ),
                ),
                Space.w(12),

                // Konten Tugas (Judul, Matkul, Deadline)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              color: _getPriorityColor(task.priority),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Space.w(6),
                          Expanded(
                            child: Text(
                              task.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.titleMedium.copyWith(
                                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                color: task.isCompleted ? AppColors.textTertiary : AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Space.h(4),
                      Text(
                        task.course,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Space.h(6),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 13.w,
                            color: isOverdue ? AppColors.danger : AppColors.textTertiary,
                          ),
                          Space.w(4),
                          Text(
                            DateFormatter.formatDeadline(task.deadline),
                            style: AppTypography.caption.copyWith(
                              color: isOverdue ? AppColors.danger : AppColors.textTertiary,
                              fontWeight: isOverdue ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                          if (task.subtasks.isNotEmpty) ...[
                            Space.w(8),
                            Text('•', style: AppTypography.caption),
                            Space.w(4),
                            Text(
                              '${task.completedSubtasksCount}/${task.totalSubtasksCount}',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),

                Space.w(8),

                // Tombol Hapus (Solid Trash Icon)
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_rounded,
                    color: AppColors.danger,
                    size: 20.w,
                  ),
                  tooltip: 'Hapus Tugas',
                  splashRadius: 20.r,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
