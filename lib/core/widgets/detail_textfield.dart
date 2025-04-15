import 'package:flutter/material.dart';

class DetailTextField extends StatelessWidget {
  const DetailTextField({
    super.key,
    required this.controller,
    required this.text
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey.shade300, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 3, color: Colors.blue.shade100)),
        border: OutlineInputBorder(),
        hintText: text,
      ),
    );
  }
}

