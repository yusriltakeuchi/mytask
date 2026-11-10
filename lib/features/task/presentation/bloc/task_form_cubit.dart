import 'package:mytask/core/bloc/safe_cubit.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_state.dart';

class TaskFormCubit extends SafeCubit<TaskFormState> {
  final TaskRepository _repository;

  TaskFormCubit(this._repository) : super(const TaskFormState.initial());

  Future<void> saveTask({
    int? id,
    required String title,
    required String course,
    required DateTime deadline,
    TaskPriority priority = TaskPriority.medium,
    String? description,
    List<SubTaskEntity> subtasks = const [],
    bool isCompleted = false,
  }) async {
    // Validasi input wajib
    if (title.trim().isEmpty) {
      emit(const TaskFormState.error('Judul tugas tidak boleh kosong'));
      return;
    }
    if (course.trim().isEmpty) {
      emit(const TaskFormState.error('Nama mata kuliah tidak boleh kosong'));
      return;
    }

    emit(const TaskFormState.submitting());

    final now = DateTime.now();

    if (id == null) {
      // Tambah Baru
      final newTask = TaskEntity(
        title: title.trim(),
        course: course.trim(),
        deadline: deadline,
        priority: priority,
        description: description?.trim().isEmpty ?? true ? null : description?.trim(),
        subtasks: subtasks,
        isCompleted: false,
        createdAt: now,
        updatedAt: now,
      );

      final result = await _repository.addTask(newTask);
      result.fold(
        (failure) => emit(TaskFormState.error(failure.message)),
        (task) => emit(TaskFormState.success(
          message: 'Tugas baru berhasil disimpan!',
          task: task,
        )),
      );
    } else {
      // Perbarui Tugas yang Sudah Ada
      final updatedTask = TaskEntity(
        id: id,
        title: title.trim(),
        course: course.trim(),
        deadline: deadline,
        priority: priority,
        description: description?.trim().isEmpty ?? true ? null : description?.trim(),
        subtasks: subtasks,
        isCompleted: isCompleted,
        createdAt: now,
        updatedAt: now,
      );

      final result = await _repository.updateTask(updatedTask);
      result.fold(
        (failure) => emit(TaskFormState.error(failure.message)),
        (task) => emit(TaskFormState.success(
          message: 'Tugas berhasil diperbarui!',
          task: task,
        )),
      );
    }
  }
}

