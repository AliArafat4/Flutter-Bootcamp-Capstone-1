import 'package:flutter/material.dart';

class CreateTeamTextField extends StatelessWidget {
  const CreateTeamTextField(
      {Key? key,
      required this.content,
      required this.controller,
      required this.keyboardType,
      this.onTapFunc})
      : super(key: key);

  final String content;

  final TextEditingController controller;

  final TextInputType keyboardType;

  final Function()? onTapFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        onTap: onTapFunc,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: content,
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
      ),
    );
  }
}
