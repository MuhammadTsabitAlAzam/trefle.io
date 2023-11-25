import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  CustomTextButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
        color: Colors.green.shade900,
      ),
      ),
    );
  }
}
