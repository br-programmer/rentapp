import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
    required this.usernameController,
    this.enable = true,
  });

  final TextEditingController usernameController;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return RentAppTextField(
      title: texts.auth.username,
      hintText: texts.auth.typeYourUsername,
      prefixIcon: RentAppIcons.user,
      controller: usernameController,
      validator: FormValidator.userNameValid,
      enabled: enable,
    );
  }
}
