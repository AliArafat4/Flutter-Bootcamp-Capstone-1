import 'package:flutter/material.dart';

SnackBar showErrorSnackBar(
  BuildContext context,
  String errormessage,
) {
  final snackBar = SnackBar(
    content: Text(errormessage),
    backgroundColor: const Color(0xffff8080),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return snackBar;
}

void showSuccessSnackBar(BuildContext context, String errormessage) {
  final snackBar = SnackBar(
    content: Text(errormessage),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
