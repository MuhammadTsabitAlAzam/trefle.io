import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function() onPressed;

  SearchField({
    required this.controller, required this.onPressed,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: 'Search plants',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear),
            onPressed: widget.onPressed,
          )
              : null,
        ),
      ),
    );
  }
}

