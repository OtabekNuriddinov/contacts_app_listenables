import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AppButton({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8,
        backgroundColor: Colors.blue.shade100,
        fixedSize: const Size(double.maxFinite, 66),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }
}
