import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return RentAppTextField.password(
      title: texts.auth.password,
      hintText: texts.auth.typeYourPassword,
      prefixIcon: RentAppIcons.lock,
      controller: passwordController,
      validator: FormValidator.passwordValid,
    );
  }
}
