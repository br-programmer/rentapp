import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/auth/presentation/login/cubits/cubits.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final usernameController = TextEditingController();
  late final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UsernameTextField(
          usernameController: usernameController,
        ),
        gap24,
        PasswordTextField(
          passwordController: passwordController,
        ),
        gap24,
        _LoginButton(
          usernameController: usernameController,
          passwordController: passwordController,
        ),
        gap32,
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  String get _username => usernameController.text;
  String get _password => passwordController.text;

  bool get _enableButton {
    return FormValidator.userNameValid(_username) == null &&
        FormValidator.passwordValid(_password) == null;
  }

  Future<void> _login(BuildContext context) async {
    final loginCubit = context.read<LoginCubit>();
    final result = await showLoader(
      context,
      loginCubit.login(username: _username, password: _password),
    );
    result.when(
      left: (httpRequestFailure) {
        var error = httpRequestFailure.whenOrNull(
          forbidden: () => texts.auth.userNoExist,
          notFound: () => texts.auth.incorrectPassword,
        );
        error ??= texts.misc.somethingWentWrong;
        RentAppSnackBar.error(context: context, title: error);
      },
      right: (_) => context.pushReplacement(HomeScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([usernameController, passwordController]),
      builder: (_, __) => RentAppPrimaryButton(
        text: texts.auth.loginNow,
        enabled: _enableButton,
        onPressed: () => _login(context),
      ),
    );
  }
}
