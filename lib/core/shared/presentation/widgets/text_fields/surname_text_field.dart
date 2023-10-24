import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class SurnameTextField extends StatelessWidget {
  const SurnameTextField({super.key, required this.surnameController});

  final TextEditingController surnameController;

  @override
  Widget build(BuildContext context) {
    return RentAppTextField(
      title: texts.auth.surname,
      hintText: texts.auth.typeYourSurname,
      prefixIcon: RentAppIcons.user,
      controller: surnameController,
      validator: FormValidator.surnameValid,
    );
  }
}
