import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.onPressed, this.color,
  });
  final double width;
  final double height;
  final String title;
  final Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: (Colors.white),
          ),
        ),
      ),
    );
  }
}
