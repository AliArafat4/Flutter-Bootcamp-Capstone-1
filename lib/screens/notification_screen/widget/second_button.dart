import 'package:flutter/material.dart';

class SecondButton extends StatelessWidget {
  const SecondButton(
      {super.key,
      required this.width,
      required this.height,
      required this.title,
      required this.onPressed,
      required this.borderColor,
      required this.textColor});

  final double width;
  final double height;
  final String title;
  final Function() onPressed;
  final Color borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(
              width: 1,
              color: borderColor,
            ),
            backgroundColor: Colors.transparent),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
