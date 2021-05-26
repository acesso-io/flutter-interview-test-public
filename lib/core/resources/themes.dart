import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        primarySwatch: AppColors.primaryColor,
        accentColor: AppColors.accentColor,
        backgroundColor: AppColors.primaryColor,
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme,
      );
}
