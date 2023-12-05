import 'package:flutter/material.dart';

class CreateTeamTextField extends StatelessWidget {
  const CreateTeamTextField(
      {Key? key,
      required this.content,
      this.controller,
      this.keyboardType,
      this.onTapFunc})
      : super(key: key);

  final String content;

  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final Function()? onTapFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onTap: onTapFunc,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: Colors.transparent)),
            filled: true,
            hintText: content,
            hintStyle: const TextStyle(fontWeight: FontWeight.w400),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
