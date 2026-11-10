// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_stats_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskStatsEntity _$TaskStatsEntityFromJson(Map<String, dynamic> json) =>
    _TaskStatsEntity(
      totalTasks: (json['totalTasks'] as num?)?.toInt() ?? 0,
      completedTasks: (json['completedTasks'] as num?)?.toInt() ?? 0,
      pendingTasks: (json['pendingTasks'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TaskStatsEntityToJson(_TaskStatsEntity instance) =>
    <String, dynamic>{
      'totalTasks': instance.totalTasks,
      'completedTasks': instance.completedTasks,
      'pendingTasks': instance.pendingTasks,
    };
