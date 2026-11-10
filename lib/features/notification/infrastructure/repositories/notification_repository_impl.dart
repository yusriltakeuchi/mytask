import 'package:mytask/core/networks/result_handler.dart';
import 'package:mytask/features/notification/domain/entities/notification_entity.dart';
import 'package:mytask/features/notification/domain/repositories/notification_repository.dart';
import 'package:mytask/features/notification/infrastructure/datasources/notification_local_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource _dataSource;

  NotificationRepositoryImpl(this._dataSource);

  @override
  ResultFuture<List<NotificationEntity>> getNotifications() {
    return safeDbCall(() => _dataSource.getNotifications());
  }

  @override
  ResultFuture<int> getUnreadCount() {
    return safeDbCall(() => _dataSource.getUnreadCount());
  }

  @override
  ResultFuture<void> markAllAsRead() {
    return safeDbCall(() => _dataSource.markAllAsRead());
  }

  @override
  ResultFuture<void> toggleRead(String id) {
    return safeDbCall(() => _dataSource.toggleRead(id));
  }
}
