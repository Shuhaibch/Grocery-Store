import 'package:flutter/material.dart';
import 'package:mechinetest/utils/constants/colors.dart';
import 'package:mechinetest/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:mechinetest/utils/theme/custom_theme/elevated_buttom_theme.dart';
import 'package:mechinetest/utils/theme/custom_theme/text_theme.dart';

class CAppTheme {
  CAppTheme._();

  //? light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: CColors.primaryColor,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    // primarySwatch: Colors.blue,
    textTheme: CTextTheme.dartTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
  );
}
