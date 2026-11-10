import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/entities/task_stats_entity.dart';

part 'task_list_state.freezed.dart';

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState.initial() = TaskListInitial;
  const factory TaskListState.loading() = TaskListLoading;
  const factory TaskListState.loaded({
    required List<TaskEntity> tasks,
    @Default(TaskFilter.all) TaskFilter filter,
    @Default(TaskStatsEntity()) TaskStatsEntity stats,
    @Default('') String searchQuery,
  }) = TaskListLoaded;
  const factory TaskListState.error(String message) = TaskListError;
}
