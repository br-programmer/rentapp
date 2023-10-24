import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    super.initialState, {
    required IAuthUsecase authUsecase,
  }) : _authUsecase = authUsecase;
  final IAuthUsecase _authUsecase;

  FutureHttpRequest<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    emit(const LoginState.loggingIn());
    final loginRequest = LoginRequest(username: username, password: password);
    final result = await _authUsecase.login(loginRequest: loginRequest);
    result.when(
      left: (_) => emit(const LoginState.errorLoggingIn()),
      right: (loginResponse) async {
        await _authUsecase.saveToken(loginResponse.token);
        emit(const LoginState.successfulLogin());
      },
    );
    return result;
  }
}
