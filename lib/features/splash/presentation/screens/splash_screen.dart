import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const name = 'splash';
  static const route = '/$name';

  Future<void> _listener(BuildContext context, AuthState state) async {
    state.whenOrNull(
      notLoggedIn: () => context.pushReplacement(LoginScreen.route),
      loggedIn: () async {
        await context.read<UserCubit>().loadUser();
        context.read<AddressCubit>().loadAddresses();
        if (context.mounted) {
          context.pushReplacement(HomeScreen.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _listener,
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: RentAppLoader(),
        ),
      ),
    );
  }
}
