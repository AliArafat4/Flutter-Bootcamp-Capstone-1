import 'package:flutter/material.dart';
import 'package:team_hack/extentions/size_extention.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.content,
    required this.onPressedFunc,
  });
  final String content;
  final Function()? onPressedFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: context.getWidth(factor: 0.5),
        height: context.getHeight(factor: 0.07),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          onPressed: onPressedFunc,
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
