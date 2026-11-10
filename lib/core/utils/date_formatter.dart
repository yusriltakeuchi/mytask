import 'package:intl/intl.dart';

/// Formatter tanggal dan waktu aplikasi
class DateFormatter {
  const DateFormatter._();

  /// Format tampilan deadline seperti di mockup: "May 28, 2025 • 11:59 PM"
  static String formatDeadline(DateTime dateTime) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');
    return '${dateFormat.format(dateTime)} • ${timeFormat.format(dateTime)}';
  }

  /// Format tanggal singkat: "28 Mei 2025"
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  /// Format waktu: "11:59"
  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// Cek apakah tugas sudah melewati deadline
  static bool isOverdue(DateTime deadline, {bool isCompleted = false}) {
    if (isCompleted) return false;
    return DateTime.now().isAfter(deadline);
  }
}

