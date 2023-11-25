import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final Function() onPressed;
  SearchButton({required this.onPressed}) ;

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
        child: Icon(Icons.search, color: Colors.white,),
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
