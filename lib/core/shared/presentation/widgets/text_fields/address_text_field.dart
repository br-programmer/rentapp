import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
    super.key,
    required this.addressController,
    this.enable = true,
    this.onDeleted,
    this.onSubmit,
  });

  final TextEditingController addressController;
  final bool enable;
  final VoidCallback? onDeleted;
  final ValueChanged<String>? onSubmit;

  @override
  Widget build(BuildContext context) {
    return RentAppTextField(
      title: texts.auth.address,
      hintText: texts.auth.typeYourAddress,
      prefixIcon: RentAppIcons.location,
      controller: addressController,
      enabled: enable,
      validator: FormValidator.addressValid,
      onDeleted: onDeleted,
      onSubmit: onSubmit,
    );
  }
}
