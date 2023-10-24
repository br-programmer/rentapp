import 'package:flutter/material.dart';

class RentAppConditionalCenter extends StatelessWidget {
  const RentAppConditionalCenter({
    super.key,
    required this.child,
    required this.centered,
  });

  final Widget child;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return centered ? Center(child: child) : child;
  }
}
