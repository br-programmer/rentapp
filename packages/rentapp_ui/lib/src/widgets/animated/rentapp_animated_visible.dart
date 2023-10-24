import 'package:flutter/material.dart';

class RentAppAnimatedVisible extends StatelessWidget {
  const RentAppAnimatedVisible({
    super.key,
    this.visible = true,
    this.child,
    this.replacement,
  });

  final bool visible;
  final Widget? child;
  final Widget? replacement;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: visible ? child : replacement ?? const SizedBox.shrink(),
    );
  }
}
