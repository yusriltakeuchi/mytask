/// Opsi filter daftar tugas
enum TaskFilter {
  all('All'),
  pending('Pending'),
  completed('Completed');

  final String label;
  const TaskFilter(this.label);
}

/// Tingkat prioritas tugas
enum TaskPriority {
  low('Low'),
  medium('Medium'),
  high('High');

  final String label;
  const TaskPriority(this.label);

  static TaskPriority fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'low':
        return TaskPriority.low;
      case 'high':
        return TaskPriority.high;
      case 'medium':
      default:
        return TaskPriority.medium;
    }
  }
}

