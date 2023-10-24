import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return RentAppTextField(
      title: texts.auth.name,
      hintText: texts.auth.typeYourName,
      prefixIcon: RentAppIcons.user,
      controller: nameController,
      validator: FormValidator.nameValid,
    );
  }
}
