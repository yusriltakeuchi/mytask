import 'package:mytask/core/bloc/safe_cubit.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/presentation/bloc/task_detail_state.dart';

class TaskDetailCubit extends SafeCubit<TaskDetailState> {
  final TaskRepository _repository;

  TaskDetailCubit(this._repository) : super(const TaskDetailState.initial());

  Future<void> loadTask(int id) async {
    emit(const TaskDetailState.loading());
    final result = await _repository.getTaskById(id);
    result.fold(
      (failure) => emit(TaskDetailState.error(failure.message)),
      (task) => emit(TaskDetailState.loaded(task)),
    );
  }

  Future<void> toggleTaskStatus() async {
    final currentState = state;
    if (currentState is! TaskDetailLoaded) return;

    final currentTask = currentState.task;
    if (currentTask.id == null) return;

    final result = await _repository.toggleTaskStatus(currentTask.id!);
    result.fold(
      (failure) => emit(TaskDetailState.error(failure.message)),
      (updatedTask) => emit(TaskDetailState.loaded(updatedTask)),
    );
  }

  Future<void> toggleSubTask(String subTaskId) async {
    final currentState = state;
    if (currentState is! TaskDetailLoaded) return;

    final currentTask = currentState.task;
    final updatedSubtasks = currentTask.subtasks.map((st) {
      if (st.id == subTaskId) {
        return st.copyWith(isDone: !st.isDone);
      }
      return st;
    }).toList();

    final allDone = updatedSubtasks.isNotEmpty &&
        updatedSubtasks.every((st) => st.isDone);

    final updatedTask = currentTask.copyWith(
      subtasks: updatedSubtasks,
      isCompleted: allDone ? true : currentTask.isCompleted,
      updatedAt: DateTime.now(),
    );

    final result = await _repository.updateTask(updatedTask);
    result.fold(
      (failure) => emit(TaskDetailState.error(failure.message)),
      (task) => emit(TaskDetailState.loaded(task)),
    );
  }

  Future<void> deleteTask() async {
    final currentState = state;
    if (currentState is! TaskDetailLoaded) return;

    final currentTask = currentState.task;
    if (currentTask.id == null) return;

    final result = await _repository.deleteTask(currentTask.id!);
    result.fold(
      (failure) => emit(TaskDetailState.error(failure.message)),
      (_) => emit(const TaskDetailState.deleted()),
    );
  }
}
