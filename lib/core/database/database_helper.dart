import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Helper pengelolaan database SQLite lokal untuk MyTask App
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  static const String _dbName = 'mytask_app.db';
  static const int _dbVersion = 2;

  static const String tableTasks = 'tasks';
  static const String tableNotifications = 'notifications';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onOpen: _onOpen,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableTasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        course TEXT NOT NULL,
        deadline TEXT NOT NULL,
        is_completed INTEGER NOT NULL DEFAULT 0,
        priority TEXT NOT NULL DEFAULT 'medium',
        description TEXT,
        subtasks TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    await _createNotificationTable(db);

    // Seed data awal tugas
    final now = DateTime.now();
    final batch = db.batch();

    batch.insert(tableTasks, {
      'title': 'Complete Flutter Assignment',
      'course': 'Mobile Development',
      'deadline': now.add(const Duration(days: 2, hours: 4)).toIso8601String(),
      'is_completed': 0,
      'priority': 'high',
      'description': 'Build and submit a complete Flutter application with clean UI and proper documentation.',
      'subtasks': '[{"id":"1","title":"Setup project structure","is_done":true},{"id":"2","title":"Design UI screens","is_done":true},{"id":"3","title":"Implement state management","is_done":true},{"id":"4","title":"Connect API and integrate data","is_done":false},{"id":"5","title":"Test and fix bugs","is_done":false}]',
      'created_at': now.subtract(const Duration(days: 1)).toIso8601String(),
      'updated_at': now.subtract(const Duration(days: 1)).toIso8601String(),
    });

    batch.insert(tableTasks, {
      'title': 'Read Chapter 4',
      'course': 'Data Structures',
      'deadline': now.add(const Duration(days: 1, hours: 2)).toIso8601String(),
      'is_completed': 1,
      'priority': 'low',
      'description': 'Read through Binary Trees and Graph representations with example implementations.',
      'subtasks': '[]',
      'created_at': now.subtract(const Duration(days: 2)).toIso8601String(),
      'updated_at': now.subtract(const Duration(hours: 3)).toIso8601String(),
    });

    batch.insert(tableTasks, {
      'title': 'Prepare for DBMS Quiz',
      'course': 'Database Systems',
      'deadline': now.add(const Duration(days: 3)).toIso8601String(),
      'is_completed': 0,
      'priority': 'high',
      'description': 'Study Normalization form (1NF to BCNF) and indexing optimizations.',
      'subtasks': '[]',
      'created_at': now.toIso8601String(),
      'updated_at': now.toIso8601String(),
    });

    batch.insert(tableTasks, {
      'title': 'Submit UI/UX Project',
      'course': 'UI/UX Design',
      'deadline': now.add(const Duration(days: 5)).toIso8601String(),
      'is_completed': 1,
      'priority': 'medium',
      'description': 'Upload Figma prototype link and user testing evaluation report.',
      'subtasks': '[]',
      'created_at': now.subtract(const Duration(days: 3)).toIso8601String(),
      'updated_at': now.subtract(const Duration(days: 1)).toIso8601String(),
    });

    await batch.commit(noResult: true);
  }

  Future<void> _onOpen(Database db) async {
    await _createNotificationTable(db);
    await _seedNotificationsIfEmpty(db);
  }

  Future<void> _createNotificationTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableNotifications (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        message TEXT NOT NULL,
        time_ago TEXT NOT NULL,
        type TEXT NOT NULL,
        is_read INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');
  }

  Future<void> _seedNotificationsIfEmpty(Database db) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $tableNotifications'),
    ) ?? 0;

    if (count == 0) {
      final now = DateTime.now();
      final batch = db.batch();

      batch.insert(tableNotifications, {
        'id': '1',
        'title': 'Deadline Tugas Mendekat! ⏳',
        'message': 'Tugas "Complete Flutter Assignment" pada mata kuliah Mobile Development jatuh tempo dalam 2 hari lagi.',
        'time_ago': '2 jam yang lalu',
        'type': 'deadline',
        'is_read': 0,
        'created_at': now.subtract(const Duration(hours: 2)).toIso8601String(),
      });

      batch.insert(tableNotifications, {
        'id': '2',
        'title': 'Pengingat Kuis Besok 📚',
        'message': 'Persiapkan diri untuk kuis "Database Systems". Pelajari Normalisasi bentuk 1NF sampai BCNF.',
        'time_ago': '5 jam yang lalu',
        'type': 'quiz',
        'is_read': 0,
        'created_at': now.subtract(const Duration(hours: 5)).toIso8601String(),
      });

      batch.insert(tableNotifications, {
        'id': '3',
        'title': 'Tugas Selesai! 🎉',
        'message': 'Tugas "Read Chapter 4" pada mata kuliah Data Structures telah berhasil ditandai selesai.',
        'time_ago': 'Kemarin',
        'type': 'success',
        'is_read': 1,
        'created_at': now.subtract(const Duration(days: 1)).toIso8601String(),
      });

      batch.insert(tableNotifications, {
        'id': '4',
        'title': 'Tugas Baru Ditambahkan 📝',
        'message': 'Tugas baru "Submit UI/UX Project" telah berhasil dijadwalkan ke daftar tugas Anda.',
        'time_ago': '2 hari yang lalu',
        'type': 'info',
        'is_read': 1,
        'created_at': now.subtract(const Duration(days: 2)).toIso8601String(),
      });

      batch.insert(tableNotifications, {
        'id': '5',
        'title': 'Selamat Datang di MyTask App 🎓',
        'message': 'Aplikasi siap digunakan untuk mencatat dan memantau tugas kuliah Anda agar tetap terorganisir.',
        'time_ago': '3 hari yang lalu',
        'type': 'info',
        'is_read': 1,
        'created_at': now.subtract(const Duration(days: 3)).toIso8601String(),
      });

      await batch.commit(noResult: true);
    }
  }

  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
