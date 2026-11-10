import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytask/features/notification/domain/entities/notification_entity.dart';

void main() {
  group('NotificationEntity Tests', () {
    test('should return correct solid icon and colors based on type', () {
      const deadlineNotif = NotificationEntity(
        id: '1',
        title: 'Deadline',
        message: 'Deadline approaching',
        timeAgo: '1h ago',
        type: 'deadline',
      );

      expect(deadlineNotif.icon, Icons.alarm_rounded);
      expect(deadlineNotif.isRead, false);

      final readNotif = deadlineNotif.copyWith(isRead: true);
      expect(readNotif.isRead, true);

      const quizNotif = NotificationEntity(
        id: '2',
        title: 'Quiz',
        message: 'Quiz tomorrow',
        timeAgo: '2h ago',
        type: 'quiz',
      );
      expect(quizNotif.icon, Icons.school_rounded);

      const successNotif = NotificationEntity(
        id: '3',
        title: 'Success',
        message: 'Task completed',
        timeAgo: '1d ago',
        type: 'success',
      );
      expect(successNotif.icon, Icons.check_circle_rounded);
    });
  });
}

