import 'package:flutter/material.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class BirthdateTextField extends StatelessWidget {
  const BirthdateTextField({super.key, required this.birthdateController});

  final TextEditingController birthdateController;

  Future<void> _getDate(BuildContext context) async {
    return RentAppModalDateSelector.show(
      context,
      onCompleted: (date) {
        if (date != null) {
          birthdateController.text = date.toBirthdate;
        }
      },
      onCompletedText: texts.misc.ok,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _getDate(context),
      child: RentAppTextField(
        title: texts.auth.birthdate,
        hintText: texts.auth.yyyymmdd,
        prefixIcon: Icons.calendar_month,
        enabled: false,
        controller: birthdateController,
        validator: FormValidator.birthDateValid,
      ),
    );
  }
}
