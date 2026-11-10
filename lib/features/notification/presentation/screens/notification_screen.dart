import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/feedback/app_snackbar.dart';
import 'package:mytask/core/components/loading/app_loading_indicator.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_shadows.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        title: Text('Notifikasi', style: AppTypography.heading3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              final unreadCount = state is NotificationLoaded ? state.unreadCount : 0;
              if (unreadCount == 0) return const SizedBox.shrink();

              return TextButton.icon(
                onPressed: () {
                  context.read<NotificationCubit>().markAllAsRead();
                  AppSnackBar.showSuccess(context, 'Semua notifikasi telah ditandai dibaca.');
                },
                icon: Icon(Icons.done_all_rounded, size: 16.w, color: AppColors.primary),
                label: Text(
                  'Tandai Dibaca',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: AppLoadingIndicator());
            }

            if (state is NotificationError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_rounded, size: 48.w, color: AppColors.danger),
                    Space.h(12),
                    Text(state.message, style: AppTypography.bodyMedium),
                    Space.h(16),
                    ElevatedButton(
                      onPressed: () => context.read<NotificationCubit>().loadNotifications(),
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              );
            }

            final notifications = state is NotificationLoaded ? state.notifications : [];

            if (notifications.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.w,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryLight,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.notifications_off_rounded, size: 36.w, color: AppColors.primary),
                    ),
                    Space.h(16),
                    Text('Tidak Ada Notifikasi', style: AppTypography.titleLarge),
                    Space.h(6),
                    Text('Semua pembaruan dan pengingat tugas akan muncul di sini.', style: AppTypography.bodyMedium),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              physics: const BouncingScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];

                return InkWell(
                  onTap: () {
                    context.read<NotificationCubit>().toggleRead(notif.id);
                  },
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: notif.isRead ? AppColors.surfaceCard : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: notif.isRead ? AppColors.borderSubtle : AppColors.primary.withValues(alpha: 0.3),
                        width: notif.isRead ? 1 : 1.5,
                      ),
                      boxShadow: AppShadows.card,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42.w,
                          height: 42.w,
                          decoration: BoxDecoration(
                            color: notif.bgColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            notif.icon,
                            color: notif.color,
                            size: 22.w,
                          ),
                        ),
                        Space.w(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      notif.title,
                                      style: AppTypography.titleSmall.copyWith(
                                        fontWeight: notif.isRead ? FontWeight.w600 : FontWeight.w700,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  if (!notif.isRead) ...[
                                    Space.w(6),
                                    Container(
                                      width: 8.w,
                                      height: 8.w,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              Space.h(4),
                              Text(
                                notif.message,
                                style: AppTypography.bodySmall.copyWith(
                                  color: notif.isRead ? AppColors.textSecondary : AppColors.textPrimary,
                                  height: 1.35,
                                ),
                              ),
                              Space.h(8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_filled_rounded,
                                    size: 12.w,
                                    color: AppColors.textTertiary,
                                  ),
                                  Space.w(4),
                                  Text(
                                    notif.timeAgo,
                                    style: AppTypography.caption.copyWith(
                                      color: AppColors.textTertiary,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
