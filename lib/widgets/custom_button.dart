import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onPressed, required this.buttonText, this.style}) : super(key: key);

  final Function()? onPressed;
  final String buttonText;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: style,
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }

}
