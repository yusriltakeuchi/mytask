import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

/// Utilitas pengaturan spasi responsif yang selaras dengan standar FleetGuard dan FuelMeter.
///
/// Contoh:
/// ```dart
/// Space.h(16) // SizedBox(height: 16.h)
/// Space.w(8)  // SizedBox(width: 8.w)
/// ```
class Space {
  const Space._();

  static SizedBox w(double width) => SizedBox(width: width.w);
  static SizedBox h(double height) => SizedBox(height: height.h);
}

/// Pusat konfigurasi metrik layar dan perangkat yang responsif.
class AppSetting {
  const AppSetting._();

  static double get deviceWidth => ScreenUtil().screenWidth;
  static double get deviceHeight => ScreenUtil().screenHeight;

  static bool isTablet(BuildContext context) => ScreenUtil().screenWidth > 600;
  static bool isMobile(BuildContext context) => ScreenUtil().screenWidth <= 600;

  static double setWidth(double width) => width.w;
  static double setHeight(double height) => height.h;
  static double setFontSize(double size) => size.sp;
  static double setRadius(double radius) => radius.r;
}

