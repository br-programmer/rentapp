import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/i18n/translations.g.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class RentApp extends StatefulWidget {
  const RentApp({super.key});

  @override
  State<RentApp> createState() => _RentAppState();
}

class _RentAppState extends State<RentApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            const AuthState.initial(),
            authUsecase: Repositories.authUsecase,
          )..checkSession(),
        ),
        BlocProvider(
          create: (context) => UserCubit(
            const UserState.loading(),
            userRepository: Repositories.user,
          ),
        ),
        BlocProvider(
          create: (context) => AddressCubit(
            const AddressState.loading(),
            addressRepository: Repositories.address,
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        darkTheme: RentAppTheme.dark,
        theme: RentAppTheme.light,
        // themeMode: ThemeMode.light,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarBrightness: context.theme.brightness,
            ),
          );
          return child!;
        },
      ),
    );
  }
}
