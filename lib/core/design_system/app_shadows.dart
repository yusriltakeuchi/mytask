import 'package:flutter/material.dart';

/// Preset bayangan permukaan kartu dan elemen elevated
class AppShadows {
  const AppShadows._();

  static List<BoxShadow> get card => [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get elevated => [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ];
}

