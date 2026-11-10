import 'package:flutter_test/flutter_test.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';

void main() {
  group('TaskEntity & SubTaskEntity Tests', () {
    final now = DateTime(2025, 5, 28, 12, 0);

    test('should calculate progress percentage correctly from subtasks', () {
      final taskWithSubtasks = TaskEntity(
        id: 1,
        title: 'Complete Flutter Assignment',
        course: 'Mobile Development',
        deadline: now,
        isCompleted: false,
        subtasks: const [
          SubTaskEntity(id: '1', title: 'Setup project structure', isDone: true),
          SubTaskEntity(id: '2', title: 'Design UI screens', isDone: true),
          SubTaskEntity(id: '3', title: 'Implement state management', isDone: true),
          SubTaskEntity(id: '4', title: 'Connect API', isDone: false),
          SubTaskEntity(id: '5', title: 'Test and fix bugs', isDone: false),
        ],
        createdAt: now,
        updatedAt: now,
      );

      expect(taskWithSubtasks.completedSubtasksCount, 3);
      expect(taskWithSubtasks.totalSubtasksCount, 5);
      expect(taskWithSubtasks.progressPercentage, 0.6); // 60%
    });

    test('should return 1.0 progress if isCompleted is true', () {
      final completedTask = TaskEntity(
        id: 2,
        title: 'Read Chapter 4',
        course: 'Data Structures',
        deadline: now,
        isCompleted: true,
        subtasks: const [],
        createdAt: now,
        updatedAt: now,
      );

      expect(completedTask.progressPercentage, 1.0);
    });

    test('TaskPriority.fromString parses properly', () {
      expect(TaskPriority.fromString('high'), TaskPriority.high);
      expect(TaskPriority.fromString('low'), TaskPriority.low);
      expect(TaskPriority.fromString('medium'), TaskPriority.medium);
      expect(TaskPriority.fromString('unknown'), TaskPriority.medium);
    });
  });
}

