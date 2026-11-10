import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/button/primary_button.dart';
import 'package:mytask/core/components/button/secondary_button.dart';
import 'package:mytask/core/components/feedback/app_snackbar.dart';
import 'package:mytask/core/components/feedback/confirmation_dialog.dart';
import 'package:mytask/core/components/loading/app_loading_indicator.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_shadows.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/core/utils/date_formatter.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/presentation/bloc/task_detail_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_detail_state.dart';
import 'package:mytask/features/task/presentation/screens/add_task_screen.dart';
import 'package:mytask/features/task/presentation/widgets/subtask_checklist_widget.dart';
import 'package:mytask/injection/injector.dart';

class TaskDetailScreen extends StatelessWidget {
  final int taskId;

  const TaskDetailScreen({super.key, required this.taskId});

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

  Color _getPriorityBg(TaskPriority priority) {
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
    return BlocProvider(
      create: (context) => sl<TaskDetailCubit>()..loadTask(taskId),
      child: Scaffold(
        backgroundColor: AppColors.bgPrimary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          actions: [
            BlocBuilder<TaskDetailCubit, TaskDetailState>(
              builder: (context, state) {
                final task = state.maybeWhen(
                  loaded: (task) => task,
                  orElse: () => null,
                );

                if (task == null) return const SizedBox.shrink();

                return PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_rounded),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  onSelected: (val) async {
                    if (val == 'edit') {
                      final updated = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                          builder: (context) => AddTaskScreen(taskToEdit: task),
                        ),
                      );
                      if (updated == true && context.mounted) {
                        context.read<TaskDetailCubit>().loadTask(taskId);
                      }
                    } else if (val == 'delete') {
                      ConfirmationDialog.show(
                        context,
                        title: 'Hapus Tugas',
                        message: 'Apakah Anda yakin ingin menghapus tugas ini secara permanen?',
                        onConfirm: () {
                          context.read<TaskDetailCubit>().deleteTask();
                        },
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_rounded, size: 18.w, color: AppColors.primary),
                          Space.w(8),
                          Text('Edit Tugas', style: AppTypography.bodyMedium),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_rounded, size: 18.w, color: AppColors.danger),
                          Space.w(8),
                          Text('Hapus', style: AppTypography.bodyMedium.copyWith(color: AppColors.danger)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<TaskDetailCubit, TaskDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              deleted: () {
                AppSnackBar.showSuccess(context, 'Tugas berhasil dihapus');
                Navigator.of(context).pop(true);
              },
              error: (msg) => AppSnackBar.showError(context, msg),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const AppLoadingIndicator(),
              loading: () => const AppLoadingIndicator(),
              error: (msg) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_rounded, size: 48.w, color: AppColors.danger),
                    Space.h(12),
                    Text(msg, style: AppTypography.bodyMedium),
                    Space.h(16),
                    ElevatedButton(
                      onPressed: () => context.read<TaskDetailCubit>().loadTask(taskId),
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
              deleted: () => const SizedBox.shrink(),
              loaded: (task) {
                final isOverdue = DateFormatter.isOverdue(task.deadline, isCompleted: task.isCompleted);

                return SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            // Course Badge
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  task.course,
                                  style: AppTypography.caption.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Space.h(12),

                            // Task Title
                            Text(
                              task.title,
                              style: AppTypography.heading1.copyWith(
                                decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                                color: task.isCompleted ? AppColors.textTertiary : AppColors.textPrimary,
                              ),
                            ),
                            Space.h(8),

                            // Notes / Description
                            if (task.description != null && task.description!.isNotEmpty) ...[
                              Text(
                                task.description!,
                                style: AppTypography.bodyLarge.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Space.h(16),
                            ],

                            // Info Cards Grid (Due Date, Priority, Status) - Solid Icons
                            Container(
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceCard,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: AppColors.borderSubtle),
                                boxShadow: AppShadows.card,
                              ),
                              child: Row(
                                children: [
                                  // Due Date Tile
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month_rounded,
                                              size: 14.w,
                                              color: isOverdue ? AppColors.danger : AppColors.textSecondary,
                                            ),
                                            Space.w(4),
                                            Text(
                                              'Due Date',
                                              style: AppTypography.caption.copyWith(
                                                color: isOverdue ? AppColors.danger : AppColors.textSecondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Space.h(4),
                                        Text(
                                          DateFormatter.formatDeadline(task.deadline),
                                          maxLines: 2,
                                          style: AppTypography.titleSmall.copyWith(
                                            color: isOverdue ? AppColors.danger : AppColors.textPrimary,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 1,
                                    color: AppColors.divider,
                                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  ),

                                  // Priority Tile
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Priority', style: AppTypography.caption),
                                      Space.h(4),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                        decoration: BoxDecoration(
                                          color: _getPriorityBg(task.priority),
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          task.priority.label,
                                          style: AppTypography.caption.copyWith(
                                            color: _getPriorityColor(task.priority),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 1,
                                    color: AppColors.divider,
                                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                                  ),

                                  // Status Tile
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Status', style: AppTypography.caption),
                                      Space.h(4),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                                        decoration: BoxDecoration(
                                          color: task.isCompleted ? AppColors.successLight : AppColors.warningLight,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          task.isCompleted ? 'Completed' : 'In Progress',
                                          style: AppTypography.caption.copyWith(
                                            color: task.isCompleted ? AppColors.success : AppColors.warning,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Space.h(20),

                            // Subtasks Checklist with Progress Bar
                            SubtaskChecklistWidget(
                              subtasks: task.subtasks,
                              onToggleSubtask: (subtaskId) {
                                context.read<TaskDetailCubit>().toggleSubTask(subtaskId);
                              },
                            ),
                            Space.h(20),
                          ],
                        ),
                      ),

                      // Bottom Floating Actions
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard,
                          border: const Border(top: BorderSide(color: AppColors.borderSubtle)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimaryButton(
                              text: task.isCompleted ? 'Mark as In Progress' : 'Mark as Completed',
                              backgroundColor: task.isCompleted ? AppColors.warning : AppColors.primary,
                              leadingIcon: task.isCompleted
                                  ? Icons.replay_rounded
                                  : Icons.check_circle_rounded,
                              onPressed: () {
                                context.read<TaskDetailCubit>().toggleTaskStatus();
                                AppSnackBar.showSuccess(
                                  context,
                                  task.isCompleted
                                      ? 'Status tugas diubah menjadi Belum Selesai'
                                      : 'Tugas berhasil diselesaikan! 🎉',
                                );
                              },
                            ),
                            Space.h(8),
                            SecondaryButton(
                              text: 'Edit Task',
                              leadingIcon: Icons.edit_rounded,
                              onPressed: () async {
                                final updated = await Navigator.of(context).push<bool>(
                                  MaterialPageRoute(
                                    builder: (context) => AddTaskScreen(taskToEdit: task),
                                  ),
                                );
                                if (updated == true && context.mounted) {
                                  context.read<TaskDetailCubit>().loadTask(taskId);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
