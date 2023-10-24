import 'package:flutter/material.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Assets.svgs.apartmentRent.svg(),
          ),
        ),
        Text(
          texts.auth.login,
          style: context.textTheme.headlineLarge,
        ),
        gap2,
        Text(
          texts.auth.andFindYourApartament,
          style: context.textTheme.bodyLarge,
        ),
        gap32,
      ],
    );
  }
}
