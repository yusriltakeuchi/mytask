import 'package:mytask/core/networks/result_handler.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/entities/task_stats_entity.dart';

/// Kontrak abstraksi repositori tugas (Domain Layer)
abstract class TaskRepository {
  /// Mengambil daftar tugas dengan filter opsional (All, Pending, Completed) dan pencarian
  ResultFuture<List<TaskEntity>> getTasks({
    TaskFilter filter = TaskFilter.all,
    String? searchQuery,
  });

  /// Mengambil detail satu tugas berdasarkan ID
  ResultFuture<TaskEntity> getTaskById(int id);

  /// Menambahkan tugas baru ke dalam database
  ResultFuture<TaskEntity> addTask(TaskEntity task);

  /// Memperbarui informasi tugas yang sudah ada
  ResultFuture<TaskEntity> updateTask(TaskEntity task);

  /// Mengubah status tugas menjadi Selesai (atau sebaliknya)
  ResultFuture<TaskEntity> toggleTaskStatus(int id);

  /// Menghapus tugas dari database berdasarkan ID
  ResultFuture<void> deleteTask(int id);

  /// Mengambil metrik statistik tugas (Total, Selesai, Belum Selesai)
  ResultFuture<TaskStatsEntity> getTaskStats();
}

