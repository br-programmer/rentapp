import 'package:flutter/material.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          texts.auth.signUp,
          style: context.textTheme.headlineLarge,
        ),
        gap2,
        Text(
          texts.auth.toDiscoverALot,
          style: context.textTheme.bodyLarge,
        ),
        gap32,
      ],
    );
  }
}
