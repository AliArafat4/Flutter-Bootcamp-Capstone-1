import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.isPassword,
    required this.content,
    this.controller,
    this.keyboardType,
    this.onlyRead,
    this.onTapFunc,
  });

  final bool isPassword;
  final String content;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? onlyRead;
  final Function()? onTapFunc;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          readOnly: widget.onlyRead ?? false,
          onTap: widget.onTapFunc,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: (widget.isPassword) ? isObscured : false,
          textAlign: TextAlign.start,
          //  style: const TextStyle(color: whiteTextColor),
          textAlignVertical: TextAlignVertical.bottom,
          // cursorColor: greyTextColor,
          decoration: InputDecoration(
              suffixIcon:
                  (widget.isPassword) ? passwordVisibility() : const SizedBox(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              filled: true,
              hintText: widget.content,
              hintStyle: const TextStyle(
                  //    color: greyTextColor,
                  //   fontSize: fontSize18,
                  fontWeight: FontWeight.w400),
              //    fillColor: darkTextColor,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent))),
        ),
      ),
    );
  }

  IconButton passwordVisibility() {
    return IconButton(
      //color: greyTextColor,
      icon: (isObscured)
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      onPressed: () {
        isObscured = !isObscured;
        setState(() {});
      },
    );
  }
}
