import 'package:mytask/core/networks/result_handler.dart';
import 'package:mytask/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  ResultFuture<List<NotificationEntity>> getNotifications();
  ResultFuture<int> getUnreadCount();
  ResultFuture<void> markAllAsRead();
  ResultFuture<void> toggleRead(String id);
}
