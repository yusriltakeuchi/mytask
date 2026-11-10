import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mytask/app.dart';
import 'package:mytask/injection/injector.dart';

/// Inisialisasi awal aplikasi di dalam guarded zone
Future<void> bootstrap() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Kunci orientasi ke portrait
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Atur status bar transparan dengan ikon gelap
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFFFFFFF),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );

      // Inisialisasi locale formatting
      await initializeDateFormatting('id_ID', null);

      // Inisialisasi dependency injection
      await initInjector();

      runApp(const MyTaskApp());
    },
    (error, stackTrace) {
      debugPrint('Uncaught root error: $error\n$stackTrace');
    },
  );
}

