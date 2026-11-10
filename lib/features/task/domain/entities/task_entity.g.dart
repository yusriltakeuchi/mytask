// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubTaskEntity _$SubTaskEntityFromJson(Map<String, dynamic> json) =>
    _SubTaskEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['is_done'] as bool? ?? false,
    );

Map<String, dynamic> _$SubTaskEntityToJson(_SubTaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_done': instance.isDone,
    };

_TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) => _TaskEntity(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  course: json['course'] as String,
  deadline: DateTime.parse(json['deadline'] as String),
  isCompleted: json['is_completed'] as bool? ?? false,
  priority:
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
      TaskPriority.medium,
  description: json['description'] as String?,
  subtasks:
      (json['subtasks'] as List<dynamic>?)
          ?.map((e) => SubTaskEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TaskEntityToJson(_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'course': instance.course,
      'deadline': instance.deadline.toIso8601String(),
      'is_completed': instance.isCompleted,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'description': instance.description,
      'subtasks': instance.subtasks,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
