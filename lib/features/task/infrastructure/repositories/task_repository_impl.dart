import 'package:mytask/core/networks/result_handler.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/entities/task_stats_entity.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/infrastructure/datasources/task_local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _localDataSource;

  TaskRepositoryImpl(this._localDataSource);

  @override
  ResultFuture<List<TaskEntity>> getTasks({
    TaskFilter filter = TaskFilter.all,
    String? searchQuery,
  }) {
    return safeDbCall(
      () => _localDataSource.getTasks(filter: filter, searchQuery: searchQuery),
    );
  }

  @override
  ResultFuture<TaskEntity> getTaskById(int id) {
    return safeDbCall(() => _localDataSource.getTaskById(id));
  }

  @override
  ResultFuture<TaskEntity> addTask(TaskEntity task) {
    return safeDbCall(() => _localDataSource.addTask(task));
  }

  @override
  ResultFuture<TaskEntity> updateTask(TaskEntity task) {
    return safeDbCall(() => _localDataSource.updateTask(task));
  }

  @override
  ResultFuture<TaskEntity> toggleTaskStatus(int id) {
    return safeDbCall(() => _localDataSource.toggleTaskStatus(id));
  }

  @override
  ResultFuture<void> deleteTask(int id) {
    return safeDbCall(() => _localDataSource.deleteTask(id));
  }

  @override
  ResultFuture<TaskStatsEntity> getTaskStats() {
    return safeDbCall(() => _localDataSource.getTaskStats());
  }
}

