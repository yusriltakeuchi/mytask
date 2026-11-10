import 'package:mytask/core/database/database_helper.dart';
import 'package:mytask/core/networks/error_handler.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/entities/task_stats_entity.dart';
import 'package:mytask/features/task/infrastructure/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskEntity>> getTasks({
    TaskFilter filter = TaskFilter.all,
    String? searchQuery,
  });
  Future<TaskEntity> getTaskById(int id);
  Future<TaskEntity> addTask(TaskEntity task);
  Future<TaskEntity> updateTask(TaskEntity task);
  Future<TaskEntity> toggleTaskStatus(int id);
  Future<void> deleteTask(int id);
  Future<TaskStatsEntity> getTaskStats();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final DatabaseHelper _databaseHelper;

  TaskLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<TaskEntity>> getTasks({
    TaskFilter filter = TaskFilter.all,
    String? searchQuery,
  }) async {
    final db = await _databaseHelper.database;

    final List<String> whereClauses = [];
    final List<dynamic> whereArgs = [];

    if (filter == TaskFilter.pending) {
      whereClauses.add('is_completed = 0');
    } else if (filter == TaskFilter.completed) {
      whereClauses.add('is_completed = 1');
    }

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      whereClauses.add('(title LIKE ? OR course LIKE ?)');
      final term = '%${searchQuery.trim()}%';
      whereArgs.add(term);
      whereArgs.add(term);
    }

    final whereString = whereClauses.isNotEmpty ? whereClauses.join(' AND ') : null;

    final maps = await db.query(
      DatabaseHelper.tableTasks,
      where: whereString,
      whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
      orderBy: 'is_completed ASC, deadline ASC',
    );

    return maps.map(TaskModel.fromMap).toList();
  }

  @override
  Future<TaskEntity> getTaskById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableTasks,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isEmpty) {
      throw const Failure(message: 'Tugas tidak ditemukan');
    }

    return TaskModel.fromMap(maps.first);
  }

  @override
  Future<TaskEntity> addTask(TaskEntity task) async {
    final db = await _databaseHelper.database;
    final map = TaskModel.toMap(task);
    map.remove('id');

    final id = await db.insert(
      DatabaseHelper.tableTasks,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return task.copyWith(id: id);
  }

  @override
  Future<TaskEntity> updateTask(TaskEntity task) async {
    if (task.id == null) {
      throw const Failure(message: 'ID tugas tidak boleh kosong saat memperbarui');
    }

    final db = await _databaseHelper.database;
    final updatedTask = task.copyWith(updatedAt: DateTime.now());
    final map = TaskModel.toMap(updatedTask);

    await db.update(
      DatabaseHelper.tableTasks,
      map,
      where: 'id = ?',
      whereArgs: [task.id],
    );

    return updatedTask;
  }

  @override
  Future<TaskEntity> toggleTaskStatus(int id) async {
    final currentTask = await getTaskById(id);
    final newStatus = !currentTask.isCompleted;

    // Jika diubah jadi selesai, subtugas juga bisa ditandai selesai
    final updatedSubtasks = newStatus
        ? currentTask.subtasks.map((s) => s.copyWith(isDone: true)).toList()
        : currentTask.subtasks;

    final updatedTask = currentTask.copyWith(
      isCompleted: newStatus,
      subtasks: updatedSubtasks,
      updatedAt: DateTime.now(),
    );

    return await updateTask(updatedTask);
  }

  @override
  Future<void> deleteTask(int id) async {
    final db = await _databaseHelper.database;
    final deletedCount = await db.delete(
      DatabaseHelper.tableTasks,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (deletedCount == 0) {
      throw const Failure(message: 'Tugas gagal dihapus atau tidak ditemukan');
    }
  }

  @override
  Future<TaskStatsEntity> getTaskStats() async {
    final db = await _databaseHelper.database;

    final totalResult = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM ${DatabaseHelper.tableTasks}'),
    ) ?? 0;

    final completedResult = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM ${DatabaseHelper.tableTasks} WHERE is_completed = 1',
      ),
    ) ?? 0;

    final pendingResult = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM ${DatabaseHelper.tableTasks} WHERE is_completed = 0',
      ),
    ) ?? 0;

    return TaskStatsEntity(
      totalTasks: totalResult,
      completedTasks: completedResult,
      pendingTasks: pendingResult,
    );
  }
}

