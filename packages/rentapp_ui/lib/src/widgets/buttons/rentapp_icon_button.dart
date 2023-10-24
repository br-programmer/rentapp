import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppIconButton extends StatelessWidget {
  const RentAppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = RentAppIconSize.bigger,
    this.color = Palette.grayLight,
  });
  final IconData icon;
  final RentAppIconSize size;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      splashRadius: 1,
      style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
      icon: RentAppIcon(
        icon: icon,
        color: color,
        size: size,
      ),
    );
  }
}
