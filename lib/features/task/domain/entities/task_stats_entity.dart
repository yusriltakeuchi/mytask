import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_stats_entity.freezed.dart';
part 'task_stats_entity.g.dart';

@freezed
abstract class TaskStatsEntity with _$TaskStatsEntity {
  const factory TaskStatsEntity({
    @Default(0) int totalTasks,
    @Default(0) int completedTasks,
    @Default(0) int pendingTasks,
  }) = _TaskStatsEntity;

  factory TaskStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskStatsEntityFromJson(json);
}

