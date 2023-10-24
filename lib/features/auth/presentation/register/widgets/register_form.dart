import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final nameController = TextEditingController();
  late final surnameController = TextEditingController();
  late final birthdateController = TextEditingController();
  late final addressController = TextEditingController();
  late final usernameController = TextEditingController();
  late final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    birthdateController.dispose();
    addressController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NameTextField(
          nameController: nameController,
        ),
        gap24,
        SurnameTextField(
          surnameController: surnameController,
        ),
        gap24,
        BirthdateTextField(
          birthdateController: birthdateController,
        ),
        gap24,
        AddressTextField(
          addressController: addressController,
        ),
        gap24,
        UsernameTextField(
          usernameController: usernameController,
        ),
        gap24,
        PasswordTextField(
          passwordController: passwordController,
        ),
        gap24,
        _RegisterButton(
          nameController: nameController,
          surnameController: surnameController,
          birthdateController: birthdateController,
          addressController: addressController,
          usernameController: usernameController,
          passwordController: passwordController,
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    required this.nameController,
    required this.surnameController,
    required this.birthdateController,
    required this.addressController,
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthdateController;
  final TextEditingController addressController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  String get _name => nameController.text;
  String get _surname => surnameController.text;
  String get _birthdate => birthdateController.text;
  String get _address => addressController.text;
  String get _username => usernameController.text;
  String get _password => passwordController.text;

  bool get _enableButton {
    return FormValidator.nameValid(_name) == null &&
        FormValidator.surnameValid(_surname) == null &&
        FormValidator.birthDateValid(_birthdate) == null &&
        FormValidator.addressValid(_address) == null &&
        FormValidator.userNameValid(_username) == null &&
        FormValidator.passwordValid(_password) == null;
  }

  Future<void> _register(BuildContext context) async {
    final registerCubit = context.read<RegisterCubit>();
    final registerRequest = RegisterRequest(
      name: _name,
      surname: _surname,
      birthdate: _birthdate,
      password: _password,
      address: _address,
      username: _username,
    );
    final result = await showLoader(
      context,
      registerCubit.register(registerRequest),
    );
    result.when(
      left: (httpRequestFailure) {
        var error = httpRequestFailure.whenOrNull(
          unprocessableEntity: () => texts.auth.usernameHasAlready,
        );
        error ??= texts.misc.somethingWentWrong;
        RentAppSnackBar.error(
          context: context,
          title: error,
        );
      },
      right: (_) {
        RentAppSnackBar.success(
          context: context,
          title: texts.auth.registrationSuccessful,
        );
        context.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        nameController,
        surnameController,
        birthdateController,
        addressController,
        usernameController,
        passwordController,
      ]),
      builder: (_, __) => RentAppPrimaryButton(
        text: texts.auth.registerNow,
        enabled: _enableButton,
        onPressed: () => _register(context),
      ),
    );
  }
}
