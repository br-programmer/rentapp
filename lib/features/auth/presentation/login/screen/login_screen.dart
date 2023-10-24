import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/auth/presentation/login/cubits/cubits.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const name = 'login';
  static const route = '/$name';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        const LoginState.initial(),
        authUsecase: Repositories.authUsecase,
      ),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: edgeInsetsH20,
            children: const [
              LoginHeader(),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
