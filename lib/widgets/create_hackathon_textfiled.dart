import 'package:flutter/material.dart';

class CreateHackathonTextFiled extends StatelessWidget {
  const CreateHackathonTextFiled({
    super.key,
    required this.content,
    this.keyboardType,
    this.onTapFunc,
    this.controller,
    this.iconButton,
    required this.isDisabled,
    this.isDetails = false,
    this.maxLines = 1,
  });

  final String content;

  final TextEditingController? controller;

  final TextInputType? keyboardType;

  final Function()? onTapFunc;

  final IconButton? iconButton;
  final bool isDisabled;
  final bool isDetails;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: InkWell(
        onTap: isDisabled ? onTapFunc : null,
        child: TextField(
          maxLines: isDetails ? 100 : maxLines,
          // onTap: onTapFunc,
          keyboardType: keyboardType,
          controller: controller,
          textAlign: TextAlign.start,
          enabled: !isDisabled,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            suffixIcon: iconButton,
            suffixIconColor: Colors.red,
            hintText: content,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400),
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
