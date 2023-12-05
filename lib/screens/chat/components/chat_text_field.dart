import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.content,
    this.controller,
    this.keyboardType,
    this.onlyRead,
    this.onTapFunc,
  });

  final String content;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? onlyRead;
  final Function()? onTapFunc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        readOnly: onlyRead ?? false,
        onTap: onTapFunc,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(25),
              child: const Icon(Icons.send),
              onTap: () {},
            ),
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
