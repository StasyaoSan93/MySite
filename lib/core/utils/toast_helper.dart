import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void show(
    String message, {
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity gravity = ToastGravity.TOP,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: toastLength == Toast.LENGTH_SHORT ? 1 : 5,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void cancel() {
    Fluttertoast.cancel();
  }
}
