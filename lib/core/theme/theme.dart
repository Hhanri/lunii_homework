import 'package:flutter/material.dart';
import 'package:lunii_homework/core/theme/app_colors.dart';
import 'package:lunii_homework/core/theme/app_shaping.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  scaffoldBackgroundColor: AppColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background
  ),


  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: AppShaping.borderRadius8,
      borderSide: BorderSide(
        color: AppColors.separator,
        width: 2
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppShaping.borderRadius8,
      borderSide: BorderSide(
        color: AppColors.separator,
        width: 2
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppShaping.borderRadius8,
      borderSide: BorderSide(
        color: AppColors.errorBackground,
        width: 2
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppShaping.borderRadius8,
      borderSide: BorderSide(
        color: AppColors.errorHighlight,
        width: 2
      ),
    ),
    filled: true,
    fillColor: Colors.white,
  ),

  useMaterial3: true,
);