import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';

part 'task_detail_state.freezed.dart';

@freezed
abstract class TaskDetailState with _$TaskDetailState {
  const factory TaskDetailState.initial() = TaskDetailInitial;
  const factory TaskDetailState.loading() = TaskDetailLoading;
  const factory TaskDetailState.loaded(TaskEntity task) = TaskDetailLoaded;
  const factory TaskDetailState.error(String message) = TaskDetailError;
  const factory TaskDetailState.deleted() = TaskDetailDeleted;
}
