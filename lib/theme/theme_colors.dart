import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_managment/config/app_colors.dart';

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.PRIMARY,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    primaryTextTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.PRIMARY,
      secondary: AppColors.SECONDARY,
      tertiary: AppColors.WHITE,
      background: AppColors.BACKGROUND,
      surface:  AppColors.WHITE
    ));

final ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.PRIMARY,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    primary: AppColorsDark.PRIMARY,
    secondary: AppColorsDark.SECONDARY,
    background: AppColorsDark.BACKGROUND,
    tertiary: AppColorsDark.BACKGROUND,
    surface: AppColorsDark.PRIMARY,
  ),
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  backgroundColor: Colors.blue,
  scaffoldBackgroundColor: AppColorsDark.SCAFFOLD_BG,
  appBarTheme: const AppBarTheme(
    color: AppColorsDark.PRIMARY,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  primaryTextTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
