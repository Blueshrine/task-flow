import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

final class ThemeConfiguration {
  ThemeConfiguration._();

  // static final _defaultInputBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(0),
  //   borderSide: BorderSide(color: Colors.grey[400]!),
  // );

  static final appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white, size: 26),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      primary: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 9, 64, 136),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(10.0),
      //border: _defaultInputBorder,
      //enabledBorder: _defaultInputBorder,
      //focusedBorder: _defaultInputBorder,
      labelStyle: AppTextStyles.instance.textRegular.copyWith(
        color: Colors.black,
      ),
      errorStyle: AppTextStyles.instance.textRegular.copyWith(
        color: const Color.fromARGB(255, 224, 52, 52),
      ),
    ),
  );
}
