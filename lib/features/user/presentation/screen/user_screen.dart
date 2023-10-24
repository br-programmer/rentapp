import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

enum NewAddress { none, add }

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});
  static const name = 'profile';
  static const route = '/$name';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserLoaded userLoadedState =
      context.read<UserCubit>().userLoadedState;

  late final nameController = TextEditingController(
    text: userLoadedState.user.name,
  );
  late final surnameController = TextEditingController(
    text: userLoadedState.user.surname,
  );
  late final birthdateController = TextEditingController(
    text: userLoadedState.user.birthdate,
  );

  late final phoneController = TextEditingController(
    text: userLoadedState.user.phone,
  );
  late final emailController = TextEditingController(
    text: userLoadedState.user.email,
  );

  late final usernameController = TextEditingController(
    text: userLoadedState.user.username,
  );

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    birthdateController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> onUpdate() {
    final updateUserRequest = UpdateUserRequest(
      name: nameController.text,
      surname: surnameController.text,
      birthdate: birthdateController.text,
      username: usernameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );
    return showLoader(
      context,
      context.read<UserCubit>().updateUser(
            updateUserRequest: updateUserRequest,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ValueCubit(value: NewAddress.none),
      child: RentAppUserLoadedBuilder(
        builder: (_, state) {
          final user = state?.user;
          return Scaffold(
            appBar: AppBar(leading: const RentAppBackButton()),
            body: SafeArea(
              child: ListView(
                padding: edgeInsets20,
                children: [
                  Text(
                    '${user?.name ?? ''} ${user?.surname ?? ''}',
                    style: context.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  gap6,
                  Text(
                    texts.user.joinedOn(
                      date: user?.createdAt.monthDayYear ?? '',
                    ),
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  gap36,
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
                  RentAppTextField(
                    title: texts.user.phone,
                    hintText: texts.user.typeYourPhone,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  gap24,
                  RentAppTextField(
                    title: texts.user.email,
                    hintText: texts.user.typeYourEmail,
                    prefixIcon: RentAppIcons.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  gap24,
                  UsernameTextField(
                    usernameController: usernameController,
                    enable: false,
                  ),
                  gap24,
                  const _Adresses(),
                  const _NewAddress(),
                  gap24,
                  RentAppPrimaryButton(
                    text: texts.user.update,
                    onPressed: onUpdate,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NewAddress extends StatefulWidget {
  const _NewAddress();

  @override
  State<_NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<_NewAddress> {
  late final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  Future<void> onAddAddress(BuildContext context) async {
    context.read<ValueCubit<NewAddress>>().change(NewAddress.none);
    if (addressController.text.isNotEmpty) {
      await showLoader(
        context,
        context.read<AddressCubit>().addAddress(
              addressController.text,
              context.read<UserCubit>().userLoadedState.user.id,
            ),
      );
      addressController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValueCubit<NewAddress>, NewAddress>(
      builder: (context, newAddress) {
        switch (newAddress) {
          case NewAddress.none:
            return Align(
              alignment: Alignment.centerLeft,
              child: RentAppTextButton(
                onPressed: () => context
                    .read<ValueCubit<NewAddress>>()
                    .change(NewAddress.add),
                text: texts.user.newAddress,
              ),
            );
          case NewAddress.add:
            return AddressTextField(
              addressController: addressController,
              onSubmit: (_) => onAddAddress(context),
            );
        }
      },
    );
  }
}

class _Adresses extends StatelessWidget {
  const _Adresses();

  Future<void> _onDeleted(BuildContext context, Address address) async {
    return showLoader(
      context,
      context.read<AddressCubit>().deletedAddress(address),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddressCubit, AddressState, AddressLoaded?>(
      selector: (state) => state.maybeMap(
        loaded: (value) => value,
        orElse: () => null,
      ),
      builder: (context, state) {
        if (state == null) {
          return const SizedBox();
        }
        final addresses = state.addresses;
        return Column(
          children: List.generate(
            addresses.length,
            (index) => Column(
              children: [
                AddressTextField(
                  addressController: TextEditingController(
                    text: addresses[index].reference,
                  ),
                  enable: false,
                  onDeleted: index == 0
                      ? null
                      : () => _onDeleted(context, addresses[index]),
                ),
                gap24,
              ],
            ),
          ),
        );
      },
    );
  }
}
