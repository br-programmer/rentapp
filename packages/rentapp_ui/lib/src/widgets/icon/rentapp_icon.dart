import 'package:flutter/material.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

enum RentAppIconSize {
  min(6),
  small(12),
  medium(16),
  large(18),
  bigger(20),
  extraBigger(24);

  const RentAppIconSize(this.size);
  final double size;
}

class RentAppIcon extends StatelessWidget {
  const RentAppIcon({
    super.key,
    required this.icon,
    this.rawSize,
    this.size = RentAppIconSize.extraBigger,
    this.color = Palette.white,
  });

  final IconData icon;
  final Color? color;
  final double? rawSize;
  final RentAppIconSize size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: rawSize ?? size.size,
      color: color,
    );
  }
}
