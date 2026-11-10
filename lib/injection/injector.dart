import 'package:get_it/get_it.dart';
import 'package:mytask/core/database/database_helper.dart';
import 'package:mytask/features/notification/domain/repositories/notification_repository.dart';
import 'package:mytask/features/notification/infrastructure/datasources/notification_local_data_source.dart';
import 'package:mytask/features/notification/infrastructure/repositories/notification_repository_impl.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/infrastructure/datasources/task_local_data_source.dart';
import 'package:mytask/features/task/infrastructure/repositories/task_repository_impl.dart';
import 'package:mytask/features/task/presentation/bloc/task_detail_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';

final GetIt sl = GetIt.instance;

/// Inisialisasi dependensi global menggunakan GetIt (Dependency Injection)
Future<void> initInjector() async {
  // 1. Database
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);

  // 2. Data Sources
  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(sl<DatabaseHelper>()),
  );
  sl.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(sl<DatabaseHelper>()),
  );

  // 3. Repositories
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(sl<TaskLocalDataSource>()),
  );
  sl.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(sl<NotificationLocalDataSource>()),
  );

  // 4. Cubits (Factory & Lazy Singleton)
  sl.registerFactory<TaskListCubit>(
    () => TaskListCubit(sl<TaskRepository>()),
  );
  sl.registerFactory<TaskFormCubit>(
    () => TaskFormCubit(sl<TaskRepository>()),
  );
  sl.registerFactory<TaskDetailCubit>(
    () => TaskDetailCubit(sl<TaskRepository>()),
  );
  sl.registerLazySingleton<NotificationCubit>(
    () => NotificationCubit(sl<NotificationRepository>()),
  );
}
