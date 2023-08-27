import 'package:flutter/material.dart';

final class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF0DA2D4);
  Color get secondary => const Color(0xFFFFAB18);
  Color get black => const Color(0xFF140E0E);
  Color get primaryDark => const Color.fromARGB(255, 7, 47, 100);
}

extension AppColorsExtension on BuildContext {
  AppColors get colors => AppColors.instance;
}
