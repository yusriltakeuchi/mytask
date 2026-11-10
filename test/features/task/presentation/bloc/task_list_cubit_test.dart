import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/entities/task_stats_entity.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_list_state.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late TaskListCubit cubit;

  final now = DateTime(2025, 5, 28);
  final sampleTask = TaskEntity(
    id: 1,
    title: 'Complete Flutter Assignment',
    course: 'Mobile Development',
    deadline: now,
    isCompleted: false,
    createdAt: now,
    updatedAt: now,
  );

  const sampleStats = TaskStatsEntity(
    totalTasks: 1,
    completedTasks: 0,
    pendingTasks: 1,
  );

  setUp(() {
    mockRepository = MockTaskRepository();
    cubit = TaskListCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('TaskListCubit Tests', () {
    test('initial state is TaskListState.initial()', () {
      expect(cubit.state, const TaskListState.initial());
    });

    blocTest<TaskListCubit, TaskListState>(
      'emits [loading, loaded] when loadTasks succeeds',
      build: () {
        when(() => mockRepository.getTaskStats())
            .thenAnswer((_) async => const Right(sampleStats));
        when(() => mockRepository.getTasks(
              filter: TaskFilter.all,
              searchQuery: '',
            )).thenAnswer((_) async => Right([sampleTask]));
        return cubit;
      },
      act: (cubit) => cubit.loadTasks(),
      expect: () => [
        const TaskListState.loading(),
        TaskListState.loaded(
          tasks: [sampleTask],
          filter: TaskFilter.all,
          stats: sampleStats,
          searchQuery: '',
        ),
      ],
    );

    blocTest<TaskListCubit, TaskListState>(
      'toggles task status and reloads tasks',
      build: () {
        when(() => mockRepository.toggleTaskStatus(1))
            .thenAnswer((_) async => Right(sampleTask.copyWith(isCompleted: true)));
        when(() => mockRepository.getTaskStats())
            .thenAnswer((_) async => const Right(sampleStats));
        when(() => mockRepository.getTasks(
              filter: TaskFilter.all,
              searchQuery: '',
            )).thenAnswer((_) async => Right([sampleTask]));
        return cubit;
      },
      act: (cubit) => cubit.toggleTaskStatus(1),
      verify: (_) {
        verify(() => mockRepository.toggleTaskStatus(1)).called(1);
      },
    );
  });
}

