import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = 'home';
  static const route = '/$name';

  @override
  Widget build(BuildContext context) {
    return RentAppUserLoadedBuilder(
      builder: (context, state) {
        final user = state?.user;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              '${user?.name ?? ''} ${user?.surname ?? ''}',
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 20),
            ),
            actions: [
              Center(
                child: RentAppCircularAvatar(
                  imageUrl: user?.photoUrl,
                  onPressed: () => context.push(UserScreen.route),
                ),
              ),
              space20,
            ],
          ),
        );
      },
    );
  }
}
