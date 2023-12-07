import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.width,
      required this.height,
      required this.title,
      required this.onPressed});
  final double width;
  final double height;
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, elevation: 0),
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
