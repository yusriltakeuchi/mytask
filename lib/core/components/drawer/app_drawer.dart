import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_state.dart';
import 'package:mytask/features/notification/presentation/screens/notification_screen.dart';
import 'package:mytask/features/profile/presentation/screens/profile_screen.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';
import 'package:mytask/features/task/presentation/screens/add_task_screen.dart';

/// Drawer samping navigasi dengan informasi akun mahasiswa
class AppDrawer extends StatelessWidget {
  final VoidCallback? onNavigateToHome;
  final VoidCallback? onNavigateToProfile;

  const AppDrawer({
    super.key,
    this.onNavigateToHome,
    this.onNavigateToProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgSecondary,
      child: Column(
        children: [
          // Drawer Header dengan informasi akun mahasiswa
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20.w, 48.h, 20.w, 20.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'MY',
                          style: AppTypography.heading2.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.verified_rounded, size: 14.w, color: AppColors.textInverse),
                          Space.w(4),
                          Text(
                            'Aktif',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textInverse,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Space.h(14),
                Text(
                  'Muhammad Yusril Rapsanjani',
                  style: AppTypography.titleLarge.copyWith(
                    color: AppColors.textInverse,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Space.h(2),
                Text(
                  'NIM: 411231045',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textInverse.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Space.h(4),
                Text(
                  'Semester 7 • Teknik Informatika • Universitas Dian Nusantara',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textInverse.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),

          // Drawer Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildDrawerItem(
                  icon: Icons.home_rounded,
                  title: 'Beranda',
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onNavigateToHome != null) onNavigateToHome!();
                  },
                ),
                BlocBuilder<NotificationCubit, NotificationState>(
                  builder: (context, state) {
                    final unreadCount = state is NotificationLoaded ? state.unreadCount : 0;

                    return _buildDrawerItem(
                      icon: Icons.notifications_rounded,
                      title: 'Notifikasi',
                      badgeText: unreadCount > 0 ? '$unreadCount Baru' : null,
                      badgeColor: AppColors.danger,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const NotificationScreen()),
                        );
                      },
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.person_rounded,
                  title: 'Profil Mahasiswa',
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onNavigateToProfile != null) {
                      onNavigateToProfile!();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ProfileScreen(showBackButton: true)),
                      );
                    }
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.add_circle_rounded,
                  title: 'Tambah Tugas Baru',
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
                    );
                  },
                ),

                const Divider(height: 24, color: AppColors.borderSubtle),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                  child: Text('Kategori Filter', style: AppTypography.caption),
                ),
                _buildDrawerItem(
                  icon: Icons.assignment_rounded,
                  title: 'Semua Tugas',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<TaskListCubit>().setFilter(TaskFilter.all);
                    if (onNavigateToHome != null) onNavigateToHome!();
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.access_time_filled_rounded,
                  title: 'Tugas Tertunda',
                  iconColor: AppColors.warning,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<TaskListCubit>().setFilter(TaskFilter.pending);
                    if (onNavigateToHome != null) onNavigateToHome!();
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.check_circle_rounded,
                  title: 'Tugas Selesai',
                  iconColor: AppColors.success,
                  onTap: () {
                    Navigator.of(context).pop();
                    context.read<TaskListCubit>().setFilter(TaskFilter.completed);
                    if (onNavigateToHome != null) onNavigateToHome!();
                  },
                ),

                const Divider(height: 24, color: AppColors.borderSubtle),

                _buildDrawerItem(
                  icon: Icons.info_rounded,
                  title: 'Tentang Aplikasi',
                  onTap: () {
                    Navigator.of(context).pop();
                    _showAboutDialog(context);
                  },
                ),
              ],
            ),
          ),

          // Drawer Footer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.borderSubtle)),
            ),
            child: Row(
              children: [
                Icon(Icons.terminal_rounded, size: 18.w, color: AppColors.textTertiary),
                Space.w(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('MyTask App v1.0.0', style: AppTypography.caption.copyWith(fontWeight: FontWeight.w600)),
                      Text('Flutter DDD • Bloc Cubit', style: AppTypography.caption),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    String? badgeText,
    Color? badgeColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? AppColors.iconPrimary, size: 22),
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: badgeText != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: (badgeColor ?? AppColors.primary).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badgeText,
                style: AppTypography.caption.copyWith(
                  color: badgeColor ?? AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      onTap: onTap,
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.school_rounded, color: AppColors.primary, size: 24),
            const SizedBox(width: 8),
            Text('MyTask App', style: AppTypography.titleLarge),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aplikasi Pengelolaan Tugas Mahasiswa', style: AppTypography.titleSmall),
            const SizedBox(height: 8),
            Text(
              'Pengembang: Muhammad Yusril Rapsanjani\nNIM: 411231045\nUniversitas Dian Nusantara\n\nDibangun dengan arsitektur Domain-Driven Design (DDD), Bloc/SafeCubit, Freezed, ScreenUtil, dan SQLite.',
              style: AppTypography.bodySmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tutup', style: AppTypography.titleSmall.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}

