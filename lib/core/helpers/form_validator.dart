import 'package:rentapp/i18n/translations.g.dart';

class FormValidator {
  const FormValidator._();

  static String? nameValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.nameIsRequired;
    }
    if (value.length < 4) {
      return texts.auth.theNameMustBe;
    }
    return null;
  }

  static String? surnameValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.surnameIsRequired;
    }
    if (value.length < 3) {
      return texts.auth.theSurnameMustBe;
    }
    return null;
  }

  static String? birthDateValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.usernameIsRequired;
    }
    return null;
  }

  static String? addressValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.addressIsRequired;
    }
    if (value.length < 4) {
      return texts.auth.addressMustBe;
    }
    return null;
  }

  static String? userNameValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.usernameIsRequired;
    }
    if (value.length < 4) {
      return texts.auth.usernameMustBe;
    }
    return null;
  }

  static String? passwordValid(String? value) {
    if (value == null || value.isEmpty) {
      return texts.auth.passwordIsRequired;
    }
    if (value.length < 6) {
      return texts.auth.passwordMustBe;
    }
    return null;
  }
}
