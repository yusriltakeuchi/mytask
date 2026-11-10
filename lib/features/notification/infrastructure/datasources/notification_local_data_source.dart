import 'package:mytask/core/database/database_helper.dart';
import 'package:mytask/features/notification/domain/entities/notification_entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class NotificationLocalDataSource {
  Future<List<NotificationEntity>> getNotifications();
  Future<int> getUnreadCount();
  Future<void> markAllAsRead();
  Future<void> toggleRead(String id);
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final DatabaseHelper _databaseHelper;

  NotificationLocalDataSourceImpl(this._databaseHelper);

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNotifications,
      orderBy: 'created_at DESC',
    );

    return maps.map((map) {
      return NotificationEntity(
        id: map['id'] as String,
        title: map['title'] as String,
        message: map['message'] as String,
        timeAgo: map['time_ago'] as String,
        type: map['type'] as String,
        isRead: (map['is_read'] as int? ?? 0) == 1,
      );
    }).toList();
  }

  @override
  Future<int> getUnreadCount() async {
    final db = await _databaseHelper.database;
    final result = Sqflite.firstIntValue(
      await db.rawQuery(
        'SELECT COUNT(*) FROM ${DatabaseHelper.tableNotifications} WHERE is_read = 0',
      ),
    );
    return result ?? 0;
  }

  @override
  Future<void> markAllAsRead() async {
    final db = await _databaseHelper.database;
    await db.update(
      DatabaseHelper.tableNotifications,
      {'is_read': 1},
    );
  }

  @override
  Future<void> toggleRead(String id) async {
    final db = await _databaseHelper.database;
    await db.rawUpdate(
      'UPDATE ${DatabaseHelper.tableNotifications} SET is_read = CASE WHEN is_read = 1 THEN 0 ELSE 1 END WHERE id = ?',
      [id],
    );
  }
}
