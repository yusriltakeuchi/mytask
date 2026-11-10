import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytask/core/design_system/app_theme.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';
import 'package:mytask/features/task/presentation/screens/home_screen.dart';
import 'package:mytask/injection/injector.dart';

class MyTaskApp extends StatelessWidget {
  const MyTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<TaskListCubit>()),
            BlocProvider(
              create: (context) => sl<NotificationCubit>()..loadNotifications(),
            ),
          ],
          child: MaterialApp(
            title: 'My Task App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            themeMode: ThemeMode.light,
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
