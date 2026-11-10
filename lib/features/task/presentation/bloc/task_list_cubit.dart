import 'package:mytask/core/bloc/safe_cubit.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_state.dart';

class TaskListCubit extends SafeCubit<TaskListState> {
  final TaskRepository _repository;

  TaskListCubit(this._repository) : super(const TaskListState.initial());

  TaskFilter _currentFilter = TaskFilter.all;
  String _currentSearch = '';

  TaskFilter get currentFilter => _currentFilter;

  Future<void> loadTasks({bool isRefresh = false}) async {
    if (!isRefresh && state is! TaskListLoaded) {
      emit(const TaskListState.loading());
    }

    final statsResult = await _repository.getTaskStats();
    final tasksResult = await _repository.getTasks(
      filter: _currentFilter,
      searchQuery: _currentSearch,
    );

    statsResult.fold(
      (failure) => emit(TaskListState.error(failure.message)),
      (stats) {
        tasksResult.fold(
          (failure) => emit(TaskListState.error(failure.message)),
          (tasks) {
            emit(
              TaskListState.loaded(
                tasks: tasks,
                filter: _currentFilter,
                stats: stats,
                searchQuery: _currentSearch,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> setFilter(TaskFilter filter) async {
    _currentFilter = filter;
    await loadTasks(isRefresh: true);
  }

  Future<void> searchTasks(String query) async {
    _currentSearch = query;
    await loadTasks(isRefresh: true);
  }

  Future<void> toggleTaskStatus(int id) async {
    final result = await _repository.toggleTaskStatus(id);
    result.fold(
      (failure) => emit(TaskListState.error(failure.message)),
      (_) async => await loadTasks(isRefresh: true),
    );
  }

  Future<void> deleteTask(int id) async {
    final result = await _repository.deleteTask(id);
    result.fold(
      (failure) => emit(TaskListState.error(failure.message)),
      (_) async => await loadTasks(isRefresh: true),
    );
  }
}
