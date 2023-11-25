import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget? child;
  DefaultButton({required this.label, required this.onPressed, this.child}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.shade900,
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          child: child ?? Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Atur radius ke 10
          ),
        ),
      ),
    );
  }
}
