import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/presentation/theme/app_color.dart';

class AppTheme {
  static ThemeData get customTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryVariant,
      // Other theme properties like brightness, buttonTheme, textTheme, etc.
      brightness: Brightness.light,
    );
  }
  // Add more themes if needed, for example, a dark theme
}
