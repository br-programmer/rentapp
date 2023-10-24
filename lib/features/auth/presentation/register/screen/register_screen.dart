import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const name = 'register';
  static const route = '/$name';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        const RegisterState.initial(),
        authUsecase: Repositories.authUsecase,
      ),
      child: Scaffold(
        appBar: AppBar(leading: const RentAppBackButton()),
        body: SafeArea(
          child: ListView(
            padding: edgeInsetsH20,
            children: const [
              RegisterHeader(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
