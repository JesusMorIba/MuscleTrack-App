import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;

  const CustomFilledButton(
      {super.key, this.onPressed, required this.text, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(50);

    return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              radius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text));
  }
}
