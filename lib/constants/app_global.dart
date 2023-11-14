import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppGlobal{
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar( SnackBar(content: Text(message)));
  }

  static ButtonStyle buttonStyle() {
    return const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
        foregroundColor: MaterialStatePropertyAll(Colors.white));
  }
}