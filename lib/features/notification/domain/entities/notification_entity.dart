import 'package:flutter/material.dart';
import 'package:mytask/core/design_system/app_colors.dart';

/// Entitas data notifikasi aplikasi
class NotificationEntity {
  final String id;
  final String title;
  final String message;
  final String timeAgo;
  final String type; // 'deadline', 'quiz', 'success', 'info'
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.type,
    this.isRead = false,
  });

  NotificationEntity copyWith({
    String? id,
    String? title,
    String? message,
    String? timeAgo,
    String? type,
    bool? isRead,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timeAgo: timeAgo ?? this.timeAgo,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }

  IconData get icon {
    switch (type) {
      case 'deadline':
        return Icons.alarm_rounded;
      case 'quiz':
        return Icons.school_rounded;
      case 'success':
        return Icons.check_circle_rounded;
      case 'info':
      default:
        return Icons.info_rounded;
    }
  }

  Color get color {
    switch (type) {
      case 'deadline':
        return AppColors.danger;
      case 'quiz':
        return AppColors.warning;
      case 'success':
        return AppColors.success;
      case 'info':
      default:
        return AppColors.primary;
    }
  }

  Color get bgColor {
    switch (type) {
      case 'deadline':
        return AppColors.dangerLight;
      case 'quiz':
        return AppColors.warningLight;
      case 'success':
        return AppColors.successLight;
      case 'info':
      default:
        return AppColors.primaryLight;
    }
  }
}

