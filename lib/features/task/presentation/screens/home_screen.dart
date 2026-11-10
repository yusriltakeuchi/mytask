import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/card/metric_card.dart';
import 'package:mytask/core/components/drawer/app_drawer.dart';
import 'package:mytask/core/components/feedback/app_snackbar.dart';
import 'package:mytask/core/components/feedback/confirmation_dialog.dart';
import 'package:mytask/core/components/loading/app_loading_indicator.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_state.dart';
import 'package:mytask/features/notification/presentation/screens/notification_screen.dart';
import 'package:mytask/features/profile/presentation/screens/profile_screen.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_state.dart';
import 'package:mytask/features/task/presentation/screens/add_task_screen.dart';
import 'package:mytask/features/task/presentation/screens/task_detail_screen.dart';
import 'package:mytask/features/task/presentation/widgets/task_filter_tabs.dart';
import 'package:mytask/features/task/presentation/widgets/task_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<TaskListCubit>().loadTasks();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToAdd() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    );
    if (result == true && mounted) {
      context.read<TaskListCubit>().loadTasks(isRefresh: true);
    }
  }

  void _navigateToNotification() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NotificationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bgPrimary,
      drawer: AppDrawer(
        onNavigateToHome: () {
          setState(() => _currentNavIndex = 0);
        },
        onNavigateToProfile: () {
          setState(() => _currentNavIndex = 2);
        },
      ),
      body: _currentNavIndex == 2
          ? const ProfileScreen(showBackButton: false)
          : _buildHomeView(context),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          border: const Border(top: BorderSide(color: AppColors.borderSubtle)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentNavIndex,
          onTap: (index) {
            if (index == 1) {
              _navigateToAdd();
            } else {
              setState(() => _currentNavIndex = index);
            }
          },
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textTertiary,
          selectedLabelStyle: AppTypography.caption.copyWith(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTypography.caption.copyWith(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded),
              activeIcon: Icon(Icons.add_circle_rounded),
              label: 'Add Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _currentNavIndex == 0
          ? FloatingActionButton(
              onPressed: _navigateToAdd,
              backgroundColor: AppColors.primary,
              elevation: 4,
              shape: const CircleBorder(),
              child: const Icon(Icons.add_rounded, color: AppColors.textInverse, size: 28),
            )
          : null,
    );
  }

  Widget _buildHomeView(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => context.read<TaskListCubit>().loadTasks(isRefresh: true),
        color: AppColors.primary,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            // Top Bar Header
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Tombol Burger untuk membuka Drawer Akun
                        Container(
                          width: 42.w,
                          height: 42.w,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceCard,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.menu_rounded, size: 22.w, color: AppColors.iconPrimary),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Space.w(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Task App',
                              style: AppTypography.heading2,
                            ),
                            Space.h(2),
                            Text(
                              'Stay organized today 👋',
                              style: AppTypography.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // Search Button
                        IconButton(
                          icon: Icon(
                            _isSearchOpen ? Icons.close_rounded : Icons.search_rounded,
                            size: 22.w,
                            color: AppColors.iconSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _isSearchOpen = !_isSearchOpen;
                              if (!_isSearchOpen) {
                                _searchController.clear();
                                context.read<TaskListCubit>().searchTasks('');
                              }
                            });
                          },
                        ),
                        // Notification Button dengan Badging Reaktif
                        BlocBuilder<NotificationCubit, NotificationState>(
                          builder: (context, state) {
                            final unreadCount = state is NotificationLoaded ? state.unreadCount : 0;

                            return Container(
                              width: 42.w,
                              height: 42.w,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceCard,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: AppColors.borderSubtle),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.notifications_rounded,
                                      size: 22.w,
                                      color: AppColors.iconSecondary,
                                    ),
                                    onPressed: _navigateToNotification,
                                    padding: EdgeInsets.zero,
                                  ),
                                  if (unreadCount > 0)
                                    Positioned(
                                      top: 8.h,
                                      right: 8.w,
                                      child: Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: const BoxDecoration(
                                          color: AppColors.danger,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar Field (Toggled)
            if (_isSearchOpen)
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    onChanged: (val) => context.read<TaskListCubit>().searchTasks(val),
                    style: AppTypography.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Cari tugas atau mata kuliah...',
                      hintStyle: AppTypography.caption,
                      prefixIcon: Icon(Icons.search_rounded, size: 20.w, color: AppColors.textTertiary),
                      filled: true,
                      fillColor: AppColors.surfaceCard,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: AppColors.borderSubtle),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: AppColors.borderSubtle),
                      ),
                    ),
                  ),
                ),
              ),

            // Metric Summary Cards (Solid Icons)
            SliverToBoxAdapter(
              child: BlocBuilder<TaskListCubit, TaskListState>(
                builder: (context, state) {
                  final stats = state.maybeWhen(
                    loaded: (tasks, filter, stats, query) => stats,
                    orElse: () => null,
                  );

                  final total = stats?.totalTasks ?? 0;
                  final completed = stats?.completedTasks ?? 0;
                  final pending = stats?.pendingTasks ?? 0;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(
                      children: [
                        MetricCard(
                          title: 'Total tasks',
                          count: total,
                          icon: Icons.assignment_rounded,
                          iconColor: AppColors.primary,
                          iconBgColor: AppColors.primaryLight,
                          onTap: () => context.read<TaskListCubit>().setFilter(TaskFilter.all),
                        ),
                        Space.w(10),
                        MetricCard(
                          title: 'Completed',
                          count: completed,
                          icon: Icons.check_circle_rounded,
                          iconColor: AppColors.success,
                          iconBgColor: AppColors.successLight,
                          onTap: () => context.read<TaskListCubit>().setFilter(TaskFilter.completed),
                        ),
                        Space.w(10),
                        MetricCard(
                          title: 'Pending',
                          count: pending,
                          icon: Icons.access_time_filled_rounded,
                          iconColor: AppColors.warning,
                          iconBgColor: AppColors.warningLight,
                          onTap: () => context.read<TaskListCubit>().setFilter(TaskFilter.pending),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Filter Tabs
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: BlocBuilder<TaskListCubit, TaskListState>(
                  builder: (context, state) {
                    final currentFilter = state.maybeWhen(
                      loaded: (tasks, filter, stats, query) => filter,
                      orElse: () => context.read<TaskListCubit>().currentFilter,
                    );

                    return TaskFilterTabs(
                      selectedFilter: currentFilter,
                      onFilterChanged: (filter) => context.read<TaskListCubit>().setFilter(filter),
                    );
                  },
                ),
              ),
            ),

            // Task List Items
            BlocConsumer<TaskListCubit, TaskListState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (msg) => AppSnackBar.showError(context, msg),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppLoadingIndicator(),
                  ),
                  loading: () => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppLoadingIndicator(),
                  ),
                  error: (message) => SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_rounded, size: 48.w, color: AppColors.danger),
                          Space.h(12),
                          Text(message, style: AppTypography.bodyMedium),
                          Space.h(16),
                          ElevatedButton(
                            onPressed: () => context.read<TaskListCubit>().loadTasks(isRefresh: true),
                            child: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  loaded: (tasks, filter, stats, searchQuery) {
                    if (tasks.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.w),
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
                                  child: Icon(
                                    Icons.checklist_rounded,
                                    size: 36.w,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Space.h(16),
                                Text(
                                  filter == TaskFilter.completed
                                      ? 'Belum ada tugas yang selesai'
                                      : 'Belum ada daftar tugas',
                                  style: AppTypography.titleLarge,
                                ),
                                Space.h(6),
                                Text(
                                  'Tekan tombol tambah di bawah untuk mulai mencatat tugas kuliahmu.',
                                  textAlign: TextAlign.center,
                                  style: AppTypography.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final task = tasks[index];
                            return TaskItemCard(
                              task: task,
                              onTap: () async {
                                final result = await Navigator.of(context).push<bool>(
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetailScreen(taskId: task.id!),
                                  ),
                                );
                                if (result == true && context.mounted) {
                                  context.read<TaskListCubit>().loadTasks(isRefresh: true);
                                }
                              },
                              onToggleStatus: () {
                                context.read<TaskListCubit>().toggleTaskStatus(task.id!);
                              },
                              onDelete: () {
                                ConfirmationDialog.show(
                                  context,
                                  title: 'Hapus Tugas',
                                  message: 'Apakah Anda yakin ingin menghapus "${task.title}"?',
                                  onConfirm: () {
                                    context.read<TaskListCubit>().deleteTask(task.id!);
                                    AppSnackBar.showSuccess(context, 'Tugas berhasil dihapus');
                                  },
                                );
                              },
                            );
                          },
                          childCount: tasks.length,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            // Bottom Spacing
            SliverToBoxAdapter(child: Space.h(80)),
          ],
        ),
      ),
    );
  }
}
