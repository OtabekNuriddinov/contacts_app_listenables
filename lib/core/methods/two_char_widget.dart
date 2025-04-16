import 'package:flutter/material.dart';

Widget twoChar(String str) {
  String firstTwoChars = str.substring(0, 2);
  return Text(
    firstTwoChars,
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  );
}
