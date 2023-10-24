import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentAppBackButton extends StatelessWidget {
  const RentAppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RentAppIconButton(
      onPressed: context.pop,
      icon: Icons.arrow_back,
    );
  }
}
