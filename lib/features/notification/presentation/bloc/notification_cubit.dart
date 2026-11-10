import 'package:mytask/core/bloc/safe_cubit.dart';
import 'package:mytask/features/notification/domain/repositories/notification_repository.dart';
import 'package:mytask/features/notification/presentation/bloc/notification_state.dart';

class NotificationCubit extends SafeCubit<NotificationState> {
  final NotificationRepository _repository;

  NotificationCubit(this._repository) : super(const NotificationInitial());

  Future<void> loadNotifications() async {
    final notifsResult = await _repository.getNotifications();
    final countResult = await _repository.getUnreadCount();

    notifsResult.fold(
      (failure) => emit(NotificationError(failure.message)),
      (notifications) {
        final unreadCount = countResult.getOrElse(() => notifications.where((n) => !n.isRead).length);
        emit(NotificationLoaded(
          notifications: notifications,
          unreadCount: unreadCount,
        ));
      },
    );
  }

  Future<void> markAllAsRead() async {
    final result = await _repository.markAllAsRead();
    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (_) async => await loadNotifications(),
    );
  }

  Future<void> toggleRead(String id) async {
    final result = await _repository.toggleRead(id);
    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (_) async => await loadNotifications(),
    );
  }
}
