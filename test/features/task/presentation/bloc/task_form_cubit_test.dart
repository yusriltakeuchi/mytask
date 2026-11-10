import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/domain/repositories/task_repository.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_state.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockRepository;
  late TaskFormCubit cubit;

  final now = DateTime(2025, 5, 28);
  final sampleTask = TaskEntity(
    id: 1,
    title: 'New Assignment',
    course: 'Mobile Programming',
    deadline: now,
    isCompleted: false,
    createdAt: now,
    updatedAt: now,
  );

  setUpAll(() {
    registerFallbackValue(sampleTask);
  });

  setUp(() {
    mockRepository = MockTaskRepository();
    cubit = TaskFormCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('TaskFormCubit Tests (Validation & Submit)', () {
    test('initial state is TaskFormState.initial()', () {
      expect(cubit.state, const TaskFormState.initial());
    });

    blocTest<TaskFormCubit, TaskFormState>(
      'emits error when title is empty (Validation Requirement #5)',
      build: () => cubit,
      act: (cubit) => cubit.saveTask(
        title: '',
        course: 'Mobile Programming',
        deadline: now,
      ),
      expect: () => [
        const TaskFormState.error('Judul tugas tidak boleh kosong'),
      ],
    );

    blocTest<TaskFormCubit, TaskFormState>(
      'emits error when course is empty (Validation Requirement #5)',
      build: () => cubit,
      act: (cubit) => cubit.saveTask(
        title: 'Assignment 1',
        course: '',
        deadline: now,
      ),
      expect: () => [
        const TaskFormState.error('Nama mata kuliah tidak boleh kosong'),
      ],
    );

    blocTest<TaskFormCubit, TaskFormState>(
      'emits [submitting, success] when saveTask succeeds',
      build: () {
        when(() => mockRepository.addTask(any()))
            .thenAnswer((_) async => Right(sampleTask));
        return cubit;
      },
      act: (cubit) => cubit.saveTask(
        title: 'New Assignment',
        course: 'Mobile Programming',
        deadline: now,
        priority: TaskPriority.high,
      ),
      expect: () => [
        const TaskFormState.submitting(),
        TaskFormState.success(
          message: 'Tugas baru berhasil disimpan!',
          task: sampleTask,
        ),
      ],
    );
  });
}

