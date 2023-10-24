part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loggingIn() = _LoggingIn;
  const factory LoginState.successfulLogin() = _SuccessfulLogin;
  const factory LoginState.errorLoggingIn() = _ErrorLoggingIn;
}
