import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentapp/core/shared/shared.dart';

class RentAppUserLoadedBuilder extends StatelessWidget {
  const RentAppUserLoadedBuilder({super.key, required this.builder});
  final BlocWidgetBuilder<UserLoaded?> builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserCubit, UserState, UserLoaded?>(
      selector: (state) => state.maybeMap(
        loaded: (value) => value,
        orElse: () => null,
      ),
      builder: builder,
    );
  }
}
