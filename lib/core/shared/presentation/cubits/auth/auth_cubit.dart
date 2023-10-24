import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentapp/features/features.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    super.initialState, {
    required IAuthUsecase authUsecase,
  }) : _authUsecase = authUsecase;

  final IAuthUsecase _authUsecase;

  Future<void> checkSession() async {
    final result = await _authUsecase.token;
    if (result.isLeft) {
      return emit(const AuthState.loggedIn());
    }
    emit(const AuthState.notLoggedIn());
  }

  Future<bool> logout() async {
    final result = await _authUsecase.logout();
    if (result.isLeft) {
      emit(const AuthState.notLoggedIn());
      return true;
    }
    return false;
  }
}
