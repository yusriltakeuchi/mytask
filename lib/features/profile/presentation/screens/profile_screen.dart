import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/feedback/app_snackbar.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_shadows.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_state.dart';

class ProfileScreen extends StatelessWidget {
  final bool showBackButton;

  const ProfileScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        title: Text('Profil Mahasiswa', style: AppTypography.heading3),
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: const BouncingScrollPhysics(),
          children: [
            // Student Identity Card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.primaryDark],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'MY',
                            style: AppTypography.heading1.copyWith(
                              color: AppColors.textInverse,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: const BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified_rounded,
                          color: AppColors.textInverse,
                          size: 14.w,
                        ),
                      ),
                    ],
                  ),
                  Space.h(14),

                  // Student Name
                  Text(
                    'Muhammad Yusril Rapsanjani',
                    textAlign: TextAlign.center,
                    style: AppTypography.heading2.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Space.h(4),

                  // NIM
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      'NIM: 411231045',
                      style: AppTypography.titleSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Space.h(10),

                  // Status & University
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school_rounded,
                        size: 16.w,
                        color: AppColors.textSecondary,
                      ),
                      Space.w(6),
                      Text(
                        'Universitas Dian Nusantara',
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Space.h(16),

            // Live Task Statistics from Cubit
            BlocBuilder<TaskListCubit, TaskListState>(
              builder: (context, state) {
                final stats = state.maybeWhen(
                  loaded: (tasks, filter, stats, query) => stats,
                  orElse: () => null,
                );

                final total = stats?.totalTasks ?? 0;
                final completed = stats?.completedTasks ?? 0;
                final pending = stats?.pendingTasks ?? 0;
                final rate = total > 0
                    ? ((completed / total) * 100).round()
                    : 0;

                return Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.borderSubtle),
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Statistik Pengerjaan Tugas',
                            style: AppTypography.titleMedium,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.successLight,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              '$rate% Selesai',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Space.h(14),
                      Row(
                        children: [
                          _buildMiniStat(
                            title: 'Total Tugas',
                            value: '$total',
                            icon: Icons.assignment_rounded,
                            color: AppColors.primary,
                            bgColor: AppColors.primaryLight,
                          ),
                          Space.w(10),
                          _buildMiniStat(
                            title: 'Selesai',
                            value: '$completed',
                            icon: Icons.check_circle_rounded,
                            color: AppColors.success,
                            bgColor: AppColors.successLight,
                          ),
                          Space.w(10),
                          _buildMiniStat(
                            title: 'Tertunda',
                            value: '$pending',
                            icon: Icons.access_time_filled_rounded,
                            color: AppColors.warning,
                            bgColor: AppColors.warningLight,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Space.h(16),

            // Academic Details
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.badge_rounded,
                        size: 20.w,
                        color: AppColors.primary,
                      ),
                      Space.w(8),
                      Text(
                        'Informasi Akademik',
                        style: AppTypography.titleMedium,
                      ),
                    ],
                  ),
                  Space.h(14),
                  _buildProfileRow(
                    label: 'Nomor Induk Mahasiswa',
                    value: '411231045',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Nama Lengkap',
                    value: 'Muhammad Yusril Rapsanjani',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Program Studi',
                    value: 'Teknik Informatika (S1)',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Fakultas',
                    value: 'Teknik dan Informatika',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Status Akademik',
                    value: 'Mahasiswa Aktif',
                  ),
                  _buildDivider(),
                  _buildProfileRow(label: 'Semester', value: 'Semester 7'),
                ],
              ),
            ),
            Space.h(16),

            // Application Tech Stack Information
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceCard,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings_suggest_rounded,
                        size: 20.w,
                        color: AppColors.primary,
                      ),
                      Space.w(8),
                      Text(
                        'Spesifikasi Aplikasi',
                        style: AppTypography.titleMedium,
                      ),
                    ],
                  ),
                  Space.h(14),
                  _buildProfileRow(
                    label: 'Arsitektur',
                    value: 'Domain-Driven Design (DDD)',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'State Management',
                    value: 'BLoC / SafeCubit',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Basis Data Lokal',
                    value: 'SQLite (sqflite v2.4.1)',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Desain Responsif',
                    value: 'Flutter ScreenUtil',
                  ),
                  _buildDivider(),
                  _buildProfileRow(
                    label: 'Versi Aplikasi',
                    value: 'v1.0.0+1 (Final Release)',
                  ),
                ],
              ),
            ),
            Space.h(24),

            // Refresh Button
            OutlinedButton.icon(
              onPressed: () {
                context.read<TaskListCubit>().loadTasks(isRefresh: true);
                AppSnackBar.showSuccess(
                  context,
                  'Data profil dan statistik disinkronkan.',
                );
              },
              icon: const Icon(Icons.sync_rounded),
              label: const Text('Sinkronkan Data & Statistik'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            Space.h(32),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStat({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18.w),
            Space.h(4),
            Text(
              value,
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Space.w(8),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: AppColors.borderSubtle);
  }
}
