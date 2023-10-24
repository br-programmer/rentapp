import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    super.initialState, {
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  final IUserRepository _userRepository;

  UserLoaded get userLoadedState => state.maybeMap(
        loaded: (value) => value,
        orElse: () => throw AssertionError(),
      );

  Future<void> loadUser() async {
    final result = await _userRepository.userInfo();
    final newState = result.when(
      left: (_) => const UserState.error(),
      right: (user) => UserState.loaded(user: user),
    );
    emit(newState);
  }

  Future<void> updateUser({
    required UpdateUserRequest updateUserRequest,
  }) async {
    final result = await _userRepository.updateUser(
      updateUserRequest: updateUserRequest,
    );
    result.whenIsRight(
      (user) => emit(userLoadedState.copyWith(user: user)),
    );
  }
}
