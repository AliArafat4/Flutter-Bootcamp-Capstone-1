import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({super.key, required this.textFieldText});

  final String textFieldText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: textFieldText,
          filled: true,
          fillColor: const Color.fromARGB(105, 158, 158, 158),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )),
    );
  }
}
