import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        primarySwatch: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.accentColor)
            .copyWith(secondary: Colors.amber),
        backgroundColor: AppColors.primaryColor,
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme,
      );
}
