import 'dart:convert';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

/// DTO Model untuk konversi antara baris SQLite Map dan TaskEntity
class TaskModel {
  const TaskModel._();

  static TaskEntity fromMap(Map<String, dynamic> map) {
    List<SubTaskEntity> subtasks = [];
    if (map['subtasks'] != null && map['subtasks'].toString().isNotEmpty) {
      try {
        final decoded = jsonDecode(map['subtasks'] as String);
        if (decoded is List) {
          subtasks = decoded
              .map((item) => SubTaskEntity.fromJson(item as Map<String, dynamic>))
              .toList();
        }
      } catch (_) {
        subtasks = [];
      }
    }

    return TaskEntity(
      id: map['id'] as int?,
      title: map['title'] as String? ?? '',
      course: map['course'] as String? ?? '',
      deadline: DateTime.tryParse(map['deadline'] as String? ?? '') ?? DateTime.now(),
      isCompleted: (map['is_completed'] as int? ?? 0) == 1,
      priority: TaskPriority.fromString(map['priority'] as String?),
      description: map['description'] as String?,
      subtasks: subtasks,
      createdAt: DateTime.tryParse(map['created_at'] as String? ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updated_at'] as String? ?? '') ?? DateTime.now(),
    );
  }

  static Map<String, dynamic> toMap(TaskEntity task) {
    final subtasksJson = jsonEncode(task.subtasks.map((s) => s.toJson()).toList());

    return {
      if (task.id != null) 'id': task.id,
      'title': task.title,
      'course': task.course,
      'deadline': task.deadline.toIso8601String(),
      'is_completed': task.isCompleted ? 1 : 0,
      'priority': task.priority.name,
      'description': task.description,
      'subtasks': subtasksJson,
      'created_at': task.createdAt.toIso8601String(),
      'updated_at': task.updatedAt.toIso8601String(),
    };
  }
}

