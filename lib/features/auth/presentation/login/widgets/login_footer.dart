import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          texts.auth.doNotHaveAnAccount,
          style: context.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        gap6,
        RentAppTextButton(
          onPressed: () => context.push(RegisterScreen.route),
          text: texts.auth.createOneHere,
        ),
      ],
    );
  }
}
