import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mytask/features/notification/domain/entities/notification_entity.dart';
import 'package:mytask/features/notification/domain/repositories/notification_repository.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_state.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  late MockNotificationRepository mockRepository;
  late NotificationCubit cubit;

  const sampleNotif = NotificationEntity(
    id: '1',
    title: 'Deadline Approaching',
    message: 'Task due soon',
    timeAgo: '1h ago',
    type: 'deadline',
    isRead: false,
  );

  setUp(() {
    mockRepository = MockNotificationRepository();
    cubit = NotificationCubit(mockRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('NotificationCubit Tests', () {
    test('initial state is NotificationInitial', () {
      expect(cubit.state, const NotificationInitial());
    });

    blocTest<NotificationCubit, NotificationState>(
      'loads notifications and unread count properly',
      build: () {
        when(() => mockRepository.getNotifications())
            .thenAnswer((_) async => const Right([sampleNotif]));
        when(() => mockRepository.getUnreadCount())
            .thenAnswer((_) async => const Right(1));
        return cubit;
      },
      act: (cubit) => cubit.loadNotifications(),
      expect: () => [
        const NotificationLoaded(
          notifications: [sampleNotif],
          unreadCount: 1,
        ),
      ],
    );

    blocTest<NotificationCubit, NotificationState>(
      'marks all as read and updates state',
      build: () {
        when(() => mockRepository.markAllAsRead())
            .thenAnswer((_) async => const Right(null));
        when(() => mockRepository.getNotifications())
            .thenAnswer((_) async => const Right([sampleNotif]));
        when(() => mockRepository.getUnreadCount())
            .thenAnswer((_) async => const Right(0));
        return cubit;
      },
      act: (cubit) => cubit.markAllAsRead(),
      expect: () => [
        const NotificationLoaded(
          notifications: [sampleNotif],
          unreadCount: 0,
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.markAllAsRead()).called(1);
      },
    );
  });
}
