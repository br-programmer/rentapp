import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppTextButton extends StatelessWidget {
  const RentAppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  });
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Palette.transparent,
      hoverColor: Palette.transparent,
      highlightColor: Palette.transparent,
      onTap: onPressed,
      child: Text(
        text,
        style: textStyle ?? context.textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
