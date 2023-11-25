import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final Function() onPressed;
  ConvertButton({required this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('C O N V E R T', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Atur radius ke 10
          ),
        ),
      ),
    );
  }
}
