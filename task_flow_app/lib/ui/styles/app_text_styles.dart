import 'package:flutter/material.dart';

final class AppTextStyles {
  static AppTextStyles? _instance;

  AppTextStyles._();

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  String get fontFamily => 'mplus1';

  TextStyle get textLight {
    return TextStyle(fontWeight: FontWeight.w300, fontFamily: fontFamily);
  }

  TextStyle get textRegular {
    return TextStyle(fontWeight: FontWeight.normal, fontFamily: fontFamily);
  }

  TextStyle get textMedium {
    return TextStyle(fontWeight: FontWeight.w500, fontFamily: fontFamily);
  }

  TextStyle get textSemiBold {
    return TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily);
  }

  TextStyle get textBold {
    return TextStyle(fontWeight: FontWeight.bold, fontFamily: fontFamily);
  }

  TextStyle get textExtraBold {
    return TextStyle(fontWeight: FontWeight.w800, fontFamily: fontFamily);
  }

  TextStyle get textTitle => textBold.copyWith(fontSize: 22);
  TextStyle get textButtonLabel => textSemiBold.copyWith(fontSize: 14);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
