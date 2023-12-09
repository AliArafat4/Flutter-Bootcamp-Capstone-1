import 'package:flutter/material.dart';

class WidgetTextFieldDate extends StatelessWidget {
  const WidgetTextFieldDate(
      {super.key,
      required this.selectDate,
      required this.controllerDate,
      required this.textfieldText});

  final TextEditingController controllerDate;
  final Function() selectDate;
  final String textfieldText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        controller: controllerDate,
        canRequestFocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(157, 255, 255, 255),
          hintText: textfieldText,
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          selectDate();
        },
      ),
    );
  }
}
