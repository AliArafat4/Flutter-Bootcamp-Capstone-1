import 'package:flutter/material.dart';

class CreateHackathonTextFiled extends StatelessWidget {
  const CreateHackathonTextFiled({
    super.key,
    required this.content,
    this.keyboardType,
    this.onTapFunc,
    this.controller,
    this.iconButton,
    this.isDisabled,
    this.isDetails = false,
  });

  final String content;

  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final Function()? onTapFunc;

  final IconButton? iconButton;
  final bool? isDisabled;
  final bool isDetails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        maxLines: isDetails ? 100 : 1,
        onTap: onTapFunc,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: TextAlign.start,
        enabled: isDisabled,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          suffixIcon: iconButton,
          suffixIconColor: Colors.red,
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
