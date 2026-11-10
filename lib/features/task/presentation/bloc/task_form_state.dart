import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';

part 'task_form_state.freezed.dart';

@freezed
abstract class TaskFormState with _$TaskFormState {
  const factory TaskFormState.initial() = TaskFormInitial;
  const factory TaskFormState.submitting() = TaskFormSubmitting;
  const factory TaskFormState.success({
    required String message,
    required TaskEntity task,
  }) = TaskFormSuccess;
  const factory TaskFormState.error(String message) = TaskFormError;
}
