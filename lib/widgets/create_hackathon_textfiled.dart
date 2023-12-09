import 'package:flutter/material.dart';

class CreateHackathonTextFiled extends StatelessWidget {
  CreateHackathonTextFiled({
    super.key,
    required this.content,
    this.keyboardType,
    this.onTapFunc,
    this.controller,
  });

  final String content;

  final TextEditingController? controller;

  final TextInputType? keyboardType;

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
