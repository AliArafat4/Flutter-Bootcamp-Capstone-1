import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showSnackBar({required BuildContext context, required String message}) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
