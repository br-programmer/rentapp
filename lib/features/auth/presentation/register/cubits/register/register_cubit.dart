import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    super.initialState, {
    required IAuthUsecase authUsecase,
  }) : _authUsecase = authUsecase;

  final IAuthUsecase _authUsecase;

  FutureHttpRequest<User> register(RegisterRequest registerRequest) async {
    emit(const RegisterState.registering());
    final result = await _authUsecase.register(
      registerRequest: registerRequest,
    );
    result.when(
      right: (_) => emit(const RegisterState.registrationSuccessful()),
      left: (_) => emit(const RegisterState.registrationError()),
    );
    return result;
  }
}
