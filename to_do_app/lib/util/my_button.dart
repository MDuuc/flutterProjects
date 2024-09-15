import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}