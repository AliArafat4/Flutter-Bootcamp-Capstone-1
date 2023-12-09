import 'package:flutter/material.dart';

class WidgetDropdownButton extends StatelessWidget {
  WidgetDropdownButton(
      {super.key, required this.listString, required this.labelDropdownButton, required this.func});

  String? dropdownValue;
  final String labelDropdownButton;
  final List<String> listString;
  final Function(String? value) func;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(labelDropdownButton),
        const SizedBox(
          width: 12,
        ),
        DropdownButton<String>(
          value: dropdownValue ?? listString.first, //if null, give me first element
          icon: const Icon(Icons.arrow_drop_down_outlined),
          elevation: 16,
          style: const TextStyle(color: Color.fromARGB(187, 0, 0, 0)),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: func,
          //     (String? value) {
          //   dropdownValue = value!;
          //
          //   //setState(() {});// bloc
          // },
          items: listString.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
