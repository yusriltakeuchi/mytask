import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
abstract class SubTaskEntity with _$SubTaskEntity {
  const factory SubTaskEntity({
    required String id,
    required String title,
    @JsonKey(name: 'is_done') @Default(false) bool isDone,
  }) = _SubTaskEntity;

  factory SubTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$SubTaskEntityFromJson(json);
}

@freezed
abstract class TaskEntity with _$TaskEntity {
  const TaskEntity._();

  const factory TaskEntity({
    int? id,
    required String title,
    required String course,
    required DateTime deadline,
    @JsonKey(name: 'is_completed') @Default(false) bool isCompleted,
    @Default(TaskPriority.medium) TaskPriority priority,
    String? description,
    @Default([]) List<SubTaskEntity> subtasks,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  /// Hitung persentase penyelesaian berdasarkan subtugas atau status utama
  double get progressPercentage {
    if (isCompleted) return 1.0;
    if (subtasks.isEmpty) return 0.0;
    final doneCount = subtasks.where((s) => s.isDone).length;
    return doneCount / subtasks.length;
  }

  int get completedSubtasksCount => subtasks.where((s) => s.isDone).length;
  int get totalSubtasksCount => subtasks.length;
}

