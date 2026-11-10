import 'package:flutter_test/flutter_test.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/infrastructure/models/task_model.dart';

void main() {
  group('TaskModel Mapping Tests', () {
    final now = DateTime.parse('2025-05-28T12:00:00.000');

    test('should map from SQLite Map correctly', () {
      final map = {
        'id': 10,
        'title': 'DBMS Assignment',
        'course': 'Database Systems',
        'deadline': now.toIso8601String(),
        'is_completed': 1,
        'priority': 'high',
        'description': 'Chapter 5 queries',
        'subtasks': '[{"id":"1","title":"Subtask 1","is_done":true}]',
        'created_at': now.toIso8601String(),
        'updated_at': now.toIso8601String(),
      };

      final task = TaskModel.fromMap(map);

      expect(task.id, 10);
      expect(task.title, 'DBMS Assignment');
      expect(task.course, 'Database Systems');
      expect(task.isCompleted, true);
      expect(task.priority, TaskPriority.high);
      expect(task.subtasks.length, 1);
      expect(task.subtasks.first.title, 'Subtask 1');
      expect(task.subtasks.first.isDone, true);
    });

    test('should map to SQLite Map correctly', () {
      final task = TaskEntity(
        id: 10,
        title: 'DBMS Assignment',
        course: 'Database Systems',
        deadline: now,
        isCompleted: true,
        priority: TaskPriority.high,
        description: 'Chapter 5 queries',
        subtasks: const [
          SubTaskEntity(id: '1', title: 'Subtask 1', isDone: true),
        ],
        createdAt: now,
        updatedAt: now,
      );

      final map = TaskModel.toMap(task);

      expect(map['id'], 10);
      expect(map['title'], 'DBMS Assignment');
      expect(map['course'], 'Database Systems');
      expect(map['is_completed'], 1);
      expect(map['priority'], 'high');
      expect(map['deadline'], now.toIso8601String());
    });
  });
}

