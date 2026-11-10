import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Skala radius sudut baku
class AppRadius {
  const AppRadius._();

  static double get xs => 4.r;
  static double get sm => 6.r;
  static double get md => 8.r;
  static double get lg => 12.r;
  static double get xl => 16.r;
  static double get xxl => 20.r;
  static double get full => 9999.r;

  static BorderRadius get borderXs => BorderRadius.circular(xs);
  static BorderRadius get borderSm => BorderRadius.circular(sm);
  static BorderRadius get borderMd => BorderRadius.circular(md);
  static BorderRadius get borderLg => BorderRadius.circular(lg);
  static BorderRadius get borderXl => BorderRadius.circular(xl);
  static BorderRadius get borderXxl => BorderRadius.circular(xxl);
  static BorderRadius get borderFull => BorderRadius.circular(full);
}

