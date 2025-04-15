import 'package:flutter/material.dart';

sealed class AppSnackBar {
  static void msg(BuildContext context, String message, {Color color = Colors.black}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: color,
        ),
      );
  }
}