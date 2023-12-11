import 'package:flutter/material.dart';

class WidgetTextFieldDate extends StatelessWidget {
  const WidgetTextFieldDate(
      {super.key,
      required this.selectDate,
      required this.controllerDate,
      required this.textFieldText});

  final TextEditingController controllerDate;
  final Function() selectDate;
  final String textFieldText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        controller: controllerDate,
        canRequestFocus: false,
        decoration: InputDecoration(
          hintText: textFieldText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          selectDate();
        },
      ),
    );
  }
}
