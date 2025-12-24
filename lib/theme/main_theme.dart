import 'package:flutter/material.dart';

class MainTheme {
  static final mainTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: backGroundColor,
      surface: backGroundColor,
      primary: blueColor,
      error: redColor,
      secondary: lightGrayColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backGroundColor,
      surfaceTintColor: backGroundColor,
      foregroundColor: darkGrayColor,
      shadowColor: blueColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: darkGrayColor,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: darkGrayColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static const backGroundColor = Color.fromARGB(239, 255, 255, 255);
  static const blueColor = Color.fromARGB(255, 0, 74, 173);
  static const redColor = Color.fromARGB(255, 228, 37, 37);
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const darkGrayColor = Color.fromARGB(255, 45, 49, 70);
  static const grayColor = Color.fromARGB(255, 142, 142, 142);
  static const lightGrayColor = Color.fromARGB(255, 148, 148, 148);
}
