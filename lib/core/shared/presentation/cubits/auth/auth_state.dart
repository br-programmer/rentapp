part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.checkSession() = _CheckSession;
  const factory AuthState.loggedIn() = _LoggedIn;
  const factory AuthState.notLoggedIn() = _NotLoggedIn;
}
